import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/domain/order/repository/order.dart';
import 'package:fashion_app/service_locator.dart';

class GetCartProductUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getCartProducts();
  }

}