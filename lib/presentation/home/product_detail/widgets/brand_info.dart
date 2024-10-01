import 'package:fashion_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class BrandInfo extends StatelessWidget {
  final ProductEntity productEntity;
  const BrandInfo({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const Text(
            'BRAND',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
          const SizedBox(height: 10),
          Text(
            productEntity.brand
          )
        ],
      ),
    );
  }
}