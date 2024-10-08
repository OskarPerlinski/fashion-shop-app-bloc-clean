// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fashion_app/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final String productSize;
  final double productPrice;
  final String productImage;
  final String createdDate;
    final String id;


  ProductOrderedModel(
      {required this.productId,
      required this.productTitle,
      required this.productSize,
      required this.productPrice,
      required this.productImage,
      required this.createdDate,
      required this.id,});

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as String,
      id: map['id'] as String,
    );
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productSize: productSize,
      productPrice: productPrice,
      productImage: productImage,
      createdDate: createdDate,
       id: id
    );
  }
}
