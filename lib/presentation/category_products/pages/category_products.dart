import 'package:fashion_app/common/bloc/product/product_display_cubit.dart';
import 'package:fashion_app/common/bloc/product/product_display_state.dart';
import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/common/widgets/card/product_card.dart';
import 'package:fashion_app/domain/categories/entity/category.dart';
import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:fashion_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:fashion_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryProductsPage({
    super.key,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(
          useCase: sl<GetProductsByCategoryIdUseCse>(),
        )..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return Column(
                children: [
                  _categoryInfo(state.products),
                  const SizedBox(height: 30),
                  _products(state.products)
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              childAspectRatio: 0.6),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
        ),
      ),
    );
  }
}
