import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/utils/app_padding.dart';
import 'package:to_do/core/widget/custom_svg_wrapper.dart';
import 'package:to_do/features/auth/views/login_view.dart';

import '../../../core/helper/navigator.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widget/custom_elevated_button.dart';

class LetsStartView extends StatelessWidget {
  static String id = AppRoute.letsStart;

  const LetsStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSvgWrapper(
                path: AppAssets.letStart,
                height: 342.h,
                width: 301.w,
              ),
              Text(
                AppString.titleLetsStart,
                style: AppTextStyle.fW400FS24CBlackLight,
                textAlign: TextAlign.center,
              ),
              Text(
                AppString.subTitleLetsStart,
                style: AppTextStyle.fW500FS16CGrey,
                textAlign: TextAlign.center,
              ),
              CustomElevatedButton(
                text: AppString.elevateLetsStart,
                onPressed: () => Navigation.goTo(
                  context,
                  LoginView(),
                  type: NavigationType.pushAndRemoveUntil,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
