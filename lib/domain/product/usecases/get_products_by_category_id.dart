import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/domain/product/repository/product.dart';
import 'package:fashion_app/service_locator.dart';

class GetProductsByCategoryIdUseCse implements Usecase<Either, String> {

  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByCategoryId(params!);
  }

}