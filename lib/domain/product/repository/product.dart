import 'package:dartz/dartz.dart';

abstract class ProductRepository {

  Future<Either> newItems();
  Future<Either> getProductsByCategoryId(String categoryId);
}