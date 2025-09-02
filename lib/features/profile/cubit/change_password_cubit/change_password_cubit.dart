import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_state.dart';
import 'package:flutter/material.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool oldPasswordSecure = true;
  bool newPasswordSecure = true;
  bool confirmPasswordSecure = true;

  void toggleOldPassword() {
    oldPasswordSecure = !oldPasswordSecure;
    emit(OldPasswordVisibilityChanged());
  }

  void toggleNewPassword() {
    newPasswordSecure = !newPasswordSecure;
    emit(NewPasswordVisibilityChanged());
  }

  void toggleConfirmPassword() {
    confirmPasswordSecure = !confirmPasswordSecure;
    emit(ConfirmPasswordVisibilityChanged());
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;

    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      emit(ChangePasswordFailure("New password and confirm password do not match"));
      return;
    }

    emit(ChangePasswordLoading());

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);

        emit(ChangePasswordSuccess());
      } else {
        emit(ChangePasswordFailure("User not logged in"));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Something went wrong";
      if (e.code == 'wrong-password') {
        errorMessage = "Old password is incorrect";
      } else if (e.code == 'weak-password') {
        errorMessage = "Password is too weak";
      } else if (e.code == 'requires-recent-login') {
        errorMessage = "Please login again and try";
      }
      emit(ChangePasswordFailure(errorMessage));
    } catch (e) {
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
