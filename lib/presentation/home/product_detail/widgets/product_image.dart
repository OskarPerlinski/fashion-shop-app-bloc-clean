import 'package:fashion_app/common/helper/images/image_display.dart';
import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 470,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
              ImageDisplayHelper.generateProductImageUrl(productEntity.image)
            ))
          ),
        ),
      ),
    );
  }
}