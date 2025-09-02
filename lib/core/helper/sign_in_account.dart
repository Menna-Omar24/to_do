/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/data/model/user_model.dart';

Future<Either<String, UserModel>> signInAccount({
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
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return Left(e.code);
  } catch (e) {
    print(e.toString());
    return Left(e.toString());
  }
}
*/
