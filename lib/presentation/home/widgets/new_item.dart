import 'package:fashion_app/common/widgets/card/product_card.dart';
import 'package:fashion_app/core/configs/assets/app_vectors.dart';
import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:fashion_app/presentation/all_categories/pages/all_categories.dart';
import 'package:fashion_app/presentation/home/bloc/new_item_display_cubit.dart';
import 'package:fashion_app/presentation/home/bloc/new_item_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewItems extends StatelessWidget {
  const NewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewItemDisplayCubit()..displayProducts(),
      child: BlocBuilder<NewItemDisplayCubit, NewItemDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _products(state.products),
                const SizedBox(height: 70),
                _exploreMore(context),
                const SizedBox(height: 30),
                _dividerProducts(),
                const SizedBox(height: 70),
                _designer(),
                const SizedBox(height: 70),
                _dividerProducts(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Expanded(
        child: SizedBox(
          height: 650,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                productEntity: products[index],
              );
            },
            itemCount: products.length < 4 ? products.length : 4,
          ),
        ),
      ),
    );
  }

  Widget _exploreMore(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AllCategoriesPage();
            },
          ),
        );
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Explore More',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
          )
        ],
      ),
    );
  }

  Widget _dividerProducts() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 100,
        right: 100,
      ),
      child: Divider(),
    );
  }

  Widget _designer() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppVectors.prada,
                height: 15,
              ),
              SvgPicture.asset(
                AppVectors.burberry,
                height: 10,
              ),
              SvgPicture.asset(
                AppVectors.boss,
                height: 20,
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppVectors.gucci,
                height: 15,
              ),
              SvgPicture.asset(
                AppVectors.tiffany,
                height: 15,
              ),
              SvgPicture.asset(
                AppVectors.catier,
                height: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
