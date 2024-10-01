import 'package:dartz/dartz.dart';
import 'package:fashion_app/data/product/models/product.dart';
import 'package:fashion_app/data/product/source/product_firebase_service.dart';
import 'package:fashion_app/domain/product/repository/product.dart';
import 'package:fashion_app/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> newItems() async {
    var returnedData = await sl<ProductFirebaseService>().newItem();
    return returnedData.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
          List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }

   @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  
}
