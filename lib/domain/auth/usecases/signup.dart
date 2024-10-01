import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/data/auth/models/user_creation_req.dart';
import 'package:fashion_app/domain/auth/repository/auth.dart';
import 'package:fashion_app/service_locator.dart';

class SignupUseCase implements Usecase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<Authreposiotry>().signup(params!);
    }

}