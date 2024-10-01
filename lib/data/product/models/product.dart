// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/domain/product/entities/product.dart';

class ProductModel {
  final Timestamp createdDate;
  final String image;
  final List<String> sizes;
  final String productId;
  final String brand;
  final int salesNumber;
  final String title;
  final num price;
  final String categoryId;

  ProductModel({
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        createdDate: map['createdDate'] as Timestamp,
        categoryId: map['categoryId'] as String,
        image: map['image'] as String,
        productId: map['productId'] as String,
        brand: map['brand'] as String,
        price: map['price'] as num,
        salesNumber: map['salesNumber'] as int,
        title: map['title'] as String,
        sizes: List<String>.from(
          map['sizes'].map((e) => e.toString()),
        ));
  }
}

extension ProductxModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      createdDate: createdDate,
      image: image,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
      price: price,
      categoryId: categoryId,
      brand: brand
    );
  }
}
