import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> newItem();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getCartProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> newItem() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(
                DateTime(2024, 9, 24),
              ))
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection(
            'Products',
          )
          .where(
            'categoryId',
            isEqualTo: categoryId,
          )
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }
  
  
}
