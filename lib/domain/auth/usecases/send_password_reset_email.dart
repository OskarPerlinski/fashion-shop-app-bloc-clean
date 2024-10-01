import 'package:dartz/dartz.dart';
import 'package:fashion_app/core/usecase/usecase.dart';
import 'package:fashion_app/domain/auth/repository/auth.dart';
import 'package:fashion_app/service_locator.dart';

class SendPasswordResetEmailUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<Authreposiotry>().sendPasswordResetEmail(params!);
    }

}