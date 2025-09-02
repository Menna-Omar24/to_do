import '../../data/model/user_model.dart';

abstract class RegisterState {}

class InitialState extends RegisterState {}

class ChangePasswordVisibility extends RegisterState {}

class ChangeConfirmPasswordVisibility extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserModel userModel;
  RegisterSuccessState({required this.userModel});
}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}
