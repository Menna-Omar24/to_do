import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  XFile? image;

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool passwordSecure = true;
  bool confirmPasswordSecure = true;

  void changePasswordVisibility() {
    passwordSecure = !passwordSecure;
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ChangeConfirmPasswordVisibility());
  }

  void onRegisterPressed() async {
    if (!formKey.currentState!.validate()) return;

    AuthRepo authRepo = AuthRepo();
    emit(RegisterLoadingState());

    var userModel = UserModel(
      name: userName.text,
      email: email.text,
      password: password.text,
    );

    var result = await authRepo.register(userModel: userModel);

    if (result) {
      emit(RegisterSuccessState(userModel: userModel));
    } else {
      emit(RegisterErrorState("Error occurred"));
    }
  }
}

/*Future<void> onRegisterPressed() async {
    if (!formKey.currentState!.validate()) {
      return;
    }*/

// emit(RegisterLoadingState());

/* AuthRepo authRepo = AuthRepo();
    var response = await authRepo.signUpAccount(
      name: userName.text,
      email: email.text,
      password: password.text,
    );
    response.fold(
      (String error) => emit(RegisterErrorState(error: error)),
      (userModel) => emit(RegisterSuccessState(userModel: userModel)),
    );
  }*/
