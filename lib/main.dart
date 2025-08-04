import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theme/app_theme.dart';
import 'package:to_do/features/splash_view/view/lets_start.dart';

import 'features/auth/login_view/login_view.dart';
import 'features/auth/register_view/register_view.dart';
import 'features/home/home_view.dart';
import 'features/splash_view/view/splash_view.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.isLightTheme,
          routes: {
            SplashView.id: (_) => SplashView(),
            LetsStart.id: (_) => LetsStart(),
            RegisterView.id: (_) => RegisterView(),
            LoginView.id: (_) => LoginView(),
            HomeView.id: (_) => HomeView(),
          },
          initialRoute: SplashView.id,
        );
      },
    );
  }
}
