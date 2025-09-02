import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/features/auth/data/model/user_model.dart';

class AuthRepo {
  Future<bool> register({required UserModel userModel}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password ?? '',
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();

      UserModel user = UserModel.fromJson(userData.data()!);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Left('Wrong password provided for that user.');
      } else {
        return Left(e.message ?? 'FirebaseAuthException');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
