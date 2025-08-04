import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/theme/app_style.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';

class SplashView extends StatelessWidget {
  static const String routeName = AppRoute.splash;

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logo),
            Text(AppString.appTitle, style: AppStyle.fW900FS36CPrimary),
          ],
        ),
      ),
    );
  }
}
