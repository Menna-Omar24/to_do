import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/auth/cubit/register/register_state.dart';
import 'package:to_do/features/auth/data/repo/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isPassword = true;
  bool isConfirmPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    emit(ChangeConfirmPasswordVisibility());
  }

  void onRegisterPressed() async {
    AuthRepo authRepo = AuthRepo();
    await authRepo.register(
      name: userName.text,
      email: email.text,
      password: password.text,
    );
  }
}
