import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../widget/custom_text_form_field.dart';

class ChangePasswordView extends StatelessWidget {
  static String id = AppRoute.changePassword;

  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/auth.png'),
          SizedBox(height: 23.h),
          CustomTextFormField(
              controller: oldPasswordController,hintText: AppString.oldPassword),
          SizedBox(height: 16.h),
          CustomTextFormField(
              controller: newPasswordController,hintText: AppString.newPassword),
          SizedBox(height: 16.h),
          CustomTextFormField(
              controller: confirmPasswordController,hintText: AppString.confirmPassword),
          Padding(
            padding: REdgeInsets.all(23.0),
            child: CustomElevatedButton(
              titleElevatedButton: AppString.elevateSave,
            ),
          ),
        ],
      ),
    );
  }
}
