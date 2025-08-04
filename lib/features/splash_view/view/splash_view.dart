import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/theme/app_style.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import 'lets_start.dart';

class SplashView extends StatefulWidget {
  static String id = AppRoute.splash;

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LetsStart()),
      );
    });
  }

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
