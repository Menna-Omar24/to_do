import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/core/utils/app_assets.dart';

import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../auth/register_view/register_view.dart';

class LetsStart extends StatelessWidget {
  static String id = AppRoute.letsStart;

  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.letStart),
              SizedBox(height: AppSize.h60),
              Text(
                AppString.titleLetsStart,
                style: AppStyle.fW400FS24CBlackGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.h40),
              Text(
                AppString.subTitleLetsStart,
                style: AppStyle.fW500FS16CGrey,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.h55),
              CustomElevatedButton(
                titleElevatedButton: AppString.elevateLetsStart,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
