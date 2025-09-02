abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordFailure(this.errorMessage);
}

final class OldPasswordVisibilityChanged extends ChangePasswordState {}

final class NewPasswordVisibilityChanged extends ChangePasswordState {}

final class ConfirmPasswordVisibilityChanged extends ChangePasswordState {}
