import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fashion_app/data/auth/models/user_creation_req.dart';
import 'package:fashion_app/data/auth/models/user_sigin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSiginReq user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
       FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'username': user.username,
        'email': user.email,
      });
      return const Right('Sign up  was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password is to weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> signin(UserSiginReq user) async {
    try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right('Sign in  was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong email or password';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
        'Password reset email is sent'
      );
    } catch(e) {
      return const Left(
        'Please try again'
      );

    }
  }
}
