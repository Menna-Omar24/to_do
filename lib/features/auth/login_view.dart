import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/home/view/home_view.dart';
import '../../core/helper/sign_in_account.dart';
import '../../core/utils/app_style.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/app_route.dart';
import '../../core/widget/custom_elevated_button.dart';
import '../../core/widget/custom_text_field.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget {
  static String id = AppRoute.login;

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

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
              controller: email,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              hintText: AppString.hintTextEmail,
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
            SizedBox(height: AppSize.h23),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 21),
              child: CustomElevatedButton(
                titleElevatedButton: AppString.elevateLogin,
                onTap: () async {
                  if (key.currentState!.validate()) {
                    bool isSignedIn = await signInAccount(
                      email.text,
                      password.text,
                    );
                    if (isSignedIn) {
                      Navigator.pushNamed(
                        context,
                        HomeView.id,
                        arguments: userName.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login failed. Please check your credentials.',
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            SizedBox(height: AppSize.h40_99),
            // Padding(
            //   padding: const EdgeInsets.all(22.0),
            //   child: CustomEleBtn(text: 'LOGIN',onPressed: (){
            //
            //   },),
            // ),
            Text.rich(
              TextSpan(
                text: AppString.doNotHaveAnAccount,
                style: AppStyle.fW200FS14CBlackLight,
                children: [
                  TextSpan(
                    text: AppString.elevateRegister,
                    style: AppStyle.fW400FS14CBlackLight,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, RegisterView.id);
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
