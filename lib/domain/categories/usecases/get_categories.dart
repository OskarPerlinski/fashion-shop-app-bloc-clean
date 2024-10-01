import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/domain/categories/repository/category.dart';
import 'package:fashion_app/service_locator.dart';

class GetCategoriesUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
  
}