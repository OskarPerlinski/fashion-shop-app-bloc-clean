import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:fashion_app/domain/auth/repository/auth.dart';
import 'package:fashion_app/service_locator.dart';

class SigninUseCase implements Usecase<Either, UserSiginReq> {
  @override
  Future<Either> call({UserSiginReq ? params}) async {
    return await sl<Authreposiotry>().signin(params!);
    }

}