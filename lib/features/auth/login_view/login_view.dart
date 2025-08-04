import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/home/home_view.dart';

import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/custom_text_field.dart';
import '../register_view/register_view.dart';

class LoginView extends StatelessWidget {
  static String id = AppRoute.login;

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.auth),
          SizedBox(height: AppSize.h23),
          CustomTextField(
            hintText: AppString.hintTextUsername,
            icons: Icons.person_2_outlined,
          ),
          SizedBox(height: AppSize.h10),
          CustomTextField(
            hintText: AppString.hintTextPassword,
            icons: Icons.lock,
          ),
          SizedBox(height: AppSize.h45),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 21),
            child: CustomElevatedButton(
              titleElevatedButton: AppString.elevateLogin,
              onTap: () {
                Navigator.pushNamed(context, HomeView.id);
              }
            ),
          ),
          SizedBox(height: AppSize.h40_99),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.doNotHaveAnAccount,
                style: AppStyle.fW200FS14CBlack,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterView.id);
                },
                child: Text(
                  AppString.elevateRegister,
                  style: AppStyle.fW400FS14CBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
