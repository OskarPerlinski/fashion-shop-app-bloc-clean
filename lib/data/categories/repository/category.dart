import 'package:dartz/dartz.dart';
import 'package:fashion_app/data/categories/models/category.dart';
import 'package:fashion_app/data/categories/source/category_firebase_service.dart';
import 'package:fashion_app/domain/categories/repository/category.dart';
import 'package:fashion_app/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
           List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}
