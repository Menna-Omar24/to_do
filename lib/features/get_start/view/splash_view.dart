import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/get_start/view/lets_start_view.dart';

import '../../../core/helper/navigator.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widget/custom_svg_wrapper.dart';

class SplashView extends StatefulWidget {
  static String id = AppRoute.splash;

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigation.goTo(
        context,
        LetsStartView(),
        type: NavigationType.pushReplacement,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgWrapper(
              path: AppAssets.logo,
              width: double.infinity,
              height: 344.h,
            ),
            Text(AppString.appTitle, style: AppTextStyle.fW900FS36CPrimary),
          ],
        ),
      ),
    );
  }
}
