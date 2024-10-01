import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  final Timestamp createdDate;
  final String image;
  final List<String> sizes;
  final String productId;
  final String brand;
  final int salesNumber;
  final String title;
  final num price;
  final String categoryId;

  ProductEntity({
    required this.createdDate,
    required this.image,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
    required this.price,
    required this.categoryId,
    required this.brand,
  });
}