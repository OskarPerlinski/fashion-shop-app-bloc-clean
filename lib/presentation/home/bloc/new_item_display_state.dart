import 'package:fashion_app/domain/product/entities/product.dart';

abstract class NewItemDisplayState {}

class ProductsLoading extends NewItemDisplayState {}

class ProductsLoaded extends NewItemDisplayState {
  List<ProductEntity> products;
  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends NewItemDisplayState {}
