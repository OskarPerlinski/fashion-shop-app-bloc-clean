import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/domain/order/repository/order.dart';
import 'package:fashion_app/service_locator.dart';

class RemoveCartProductUseCase implements Usecase<Either, String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }

}