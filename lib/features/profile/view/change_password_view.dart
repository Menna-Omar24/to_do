import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_padding.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';
import 'package:to_do/core/widget/default_flag.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../cubit/change_password_cubit/change_password_cubit.dart';
import '../cubit/change_password_cubit/change_password_state.dart';

class ChangePasswordView extends StatelessWidget {
  static String id = AppRoute.changePassword;

  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password Changed Successfully")),
            );
          }
          if (state is ChangePasswordFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          final cubit = ChangePasswordCubit.get(context);

          return Scaffold(
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DefaultFlag(),
                    SizedBox(height: 23.h),
                    Padding(
                      padding: AppPadding.defaultPadding,
                      child: Column(
                        children: [
                          // Old Password
                          CustomTextFormField(
                            controller: cubit.oldPasswordController,
                            hintText: AppString.oldPassword,
                            obscureText: cubit.oldPasswordSecure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.oldPasswordSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => cubit.toggleOldPassword(),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Old password is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),

                          // New Password
                          CustomTextFormField(
                            controller: cubit.newPasswordController,
                            hintText: AppString.newPassword,
                            obscureText: cubit.newPasswordSecure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.newPasswordSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => cubit.toggleNewPassword(),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "New password is required";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),

                          // Confirm Password
                          CustomTextFormField(
                            controller: cubit.confirmPasswordController,
                            hintText: AppString.confirmPassword,
                            obscureText: cubit.confirmPasswordSecure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.confirmPasswordSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => cubit.toggleConfirmPassword(),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Confirm password is required";
                              }
                              if (value != cubit.newPasswordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 23.h),

                          // Save Button
                          CustomElevatedButton(
                            text: state is ChangePasswordLoading
                                ? "Loading..."
                                : AppString.elevateSave,
                            onPressed: state is ChangePasswordLoading
                                ? null
                                : () => cubit.changePassword(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
