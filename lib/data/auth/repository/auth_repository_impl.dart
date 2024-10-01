import 'package:dartz/dartz.dart';
import 'package:fashion_app/data/auth/models/user_creation_req.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:fashion_app/data/auth/source/auth_firebase_service.dart';
import 'package:fashion_app/domain/auth/repository/auth.dart';
import 'package:fashion_app/service_locator.dart';

class AuthRepositoryImpl extends Authreposiotry {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> signin(UserSiginReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

} 