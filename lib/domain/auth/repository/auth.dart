import 'package:dartz/dartz.dart';
import 'package:fashion_app/data/auth/models/user_creation_req.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';

abstract class Authreposiotry {

  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSiginReq user);
  Future<Either> sendPasswordResetEmail(String email);
}