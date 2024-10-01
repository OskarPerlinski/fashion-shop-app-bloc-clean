import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Text(
        "${productEntity.price}\$",
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
