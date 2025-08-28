import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/features/auth/data/model/user_model.dart';

class AuthRepo {
  Future<bool> register({required UserModel userModel}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
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
    }
    return false;
  }

  login({required UserModel userModel}) {
    print('register');
  }
}
