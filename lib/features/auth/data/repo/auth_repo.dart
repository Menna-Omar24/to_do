import 'package:to_do/core/helper/create_account.dart';
import 'package:to_do/features/auth/data/model/user_model.dart';

class AuthRepo {
  Future<UserModel> login({required String email, required String password}) {
    return Future.delayed(Duration(seconds: 2), () {
      return UserModel(name: 'mohamed', email: email);
    });
  }

  Future register({
    required String name,
    required String email,
    required String password,
  }) async {
    createAccount(email, password);
  }
}