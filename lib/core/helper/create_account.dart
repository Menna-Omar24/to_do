/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/features/auth/data/model/user_model.dart';

Future<Either<String, UserModel>> signUpAccount(
    {required String name, required String email,required String password}) async {
  try {
   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
   UserModel user=UserModel(id: credential.user!.uid,name: name, email: email);
   await FirebaseFirestore.instance.collection('users').doc(user.id).set(user.toJson());
    return Right(user);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return Left(e.code);
  } catch (e) {
    print(e.toString());
    return Left(e.toString());
  }
}

*/
