import 'package:fashion_app/common/bloc/button/button_state_cubit.dart';
import 'package:fashion_app/common/widgets/appbar/basic_appbar.dart';
import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:fashion_app/presentation/home/product_detail/bloc/product_selection_size_cubit.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/add_to_basket.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/brand_info.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/contact.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/product_image.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/product_price.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/product_title.dart';
import 'package:fashion_app/presentation/home/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductSizeSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonStateCubit(),
        )
      ],
      child: Scaffold(
        appBar: const BasicAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(productEntity: productEntity),
                const SizedBox(height: 40),
                ProductTitle(productEntity: productEntity),
                const SizedBox(height: 10),
                ProductPrice(productEntity: productEntity),
                const SizedBox(height: 20),
                SelectedSize(productEntity: productEntity),
                const SizedBox(height: 10),
                AddToBasket(productEntity: productEntity),
                const SizedBox(height: 30),
                BrandInfo(productEntity: productEntity),
                const SizedBox(height: 30),
                const Contact()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
