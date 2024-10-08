import 'package:fashion_app/domain/order/entity/product_ordered.dart';

abstract class CartProductsDisplayState {}

class CartProductsLoading extends CartProductsDisplayState {}

class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductsLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductsDisplayState {}