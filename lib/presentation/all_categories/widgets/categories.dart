import 'package:fashion_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:fashion_app/common/bloc/categories/categories_display_state.dart';
import 'package:fashion_app/common/helper/navigator/app_navigator.dart';
import 'package:fashion_app/presentation/category_products/pages/category_products.dart';
import 'package:fashion_app/presentation/home/bloc/new_item_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoaded) {
          return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: GestureDetector(
                onTap: () {
                  AppNavigator.push(context, CategoryProductsPage(categoryEntity: state.categories[index],));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.categories[index].title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: state.categories.length,
      );
        }
        return Container();
      },
    )
    );
  }
}
