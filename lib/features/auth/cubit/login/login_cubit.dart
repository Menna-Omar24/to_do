import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(LoginChangePasswordVisibility());
  }

  AuthRepo repo = AuthRepo();

  void login() async {
    // if formKey.currentState?.validate()
    UserModel user = await repo.login(
      email: userName.text,
      password: password.text,
    );
  }
}
