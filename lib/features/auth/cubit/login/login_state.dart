import '../../data/model/user_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginChangePasswordVisibility extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}

class LoginSuccessState extends LoginState {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}
