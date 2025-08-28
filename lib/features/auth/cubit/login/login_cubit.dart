import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(LoginChangePasswordVisibility());
  }

/*  final AuthRepo repo = AuthRepo();

  void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoadingState());
    var loginResponse = await repo.signInAccount(
      email: email.text,
      password: password.text,
    );
    loginResponse.fold(
      (String error) => emit(LoginErrorState(error: error)),
      (userModel) => emit(LoginSuccessState(userModel: userModel)),
    );
  }*/
}
