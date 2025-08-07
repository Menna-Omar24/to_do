import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';

import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_text_field.dart';
import '../login_view/login_view.dart';

class RegisterView extends StatelessWidget {
  static String id = AppRoute.register;

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    GlobalKey<FormState> key = GlobalKey();

    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          children: [
            Image.asset(AppAssets.auth),
            SizedBox(height: AppSize.h23),
            CustomTextField(
              controller: userName,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              hintText: AppString.hintTextUsername,
              icon: AppAssets.profileOutline,
            ),
            SizedBox(height: AppSize.h10),
            CustomTextField(
              controller: password,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              hintText: AppString.hintTextPassword,
              icon: AppAssets.password,
              isPassword: true,
            ),
            SizedBox(height: AppSize.h10),
            CustomTextField(
              controller: confirmPassword,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please confirm your password';
                } else if (value != password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              hintText: AppString.hintTextConfirmPassword,
              icon: AppAssets.password,
              isPassword: true,
            ),
            SizedBox(height: AppSize.h23),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 21),
              child: CustomElevatedButton(
                titleElevatedButton: AppString.elevateRegister,
                onTap: () {
                  if (key.currentState!.validate()) {

                  }
                },
              ),
            ),
            SizedBox(height: AppSize.h40_99),
            Text.rich(
              TextSpan(
                text: AppString.alreadyHaveAnAccount,
                style: AppStyle.fW200FS14CBlackLight,
                children: [
                  TextSpan(
                    text: AppString.elevateLogin,
                    style: AppStyle.fW400FS14CBlackLight,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
