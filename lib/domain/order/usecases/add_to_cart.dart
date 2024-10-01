import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/data/order/models/add_to_cart_req.dart';
import 'package:fashion_app/domain/order/repository/order.dart';
import 'package:fashion_app/service_locator.dart';

class AddToCartUseCase implements Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return sl<OrderRepository>().addToCart(params!);
  }
}
