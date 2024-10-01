import 'package:fashion_app/domain/order/entity/product_ordered.dart';
import 'package:fashion_app/domain/order/usecases/get_cart_product.dart';
import 'package:fashion_app/domain/order/usecases/remove_cart_product.dart';
import 'package:fashion_app/presentation/cart/bloc/cart_products_state.dart';
import 'package:fashion_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedDate = await sl<GetCartProductUseCase>().call();

    returnedDate.fold(
      (error) {
        emit(
          LoadCartProductsFailure(),
        );
      },
      (data) {
        emit(
          CartProductsLoaded(products: data),
        );
      },
    );
  }
  void removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
     var returnedData = await sl<RemoveCartProductUseCase>().call(
      params: product.id
     );
    returnedData.fold(
      (error) {
        emit(
          LoadCartProductsFailure(),
        );
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}