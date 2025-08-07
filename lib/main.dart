import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theme/app_theme.dart';
import 'package:to_do/features/splash_view/view/lets_start.dart';

import 'features/auth/login_view/login_view.dart';
import 'features/auth/register_view/register_view.dart';
import 'features/home/task/home_task.dart';
import 'features/home/task/personal_task.dart';
import 'features/home/task/work_task.dart';
import 'features/home/view/home_view.dart';
import 'features/profile/view/change_password_view.dart';
import 'features/profile/view/profile_view.dart';
import 'features/profile/view/setting_view.dart';
import 'features/profile/view/update_profile_view.dart';
import 'features/splash_view/view/splash_view.dart';
import 'features/today_task/view/add_task.dart';
import 'features/today_task/view/edit_task.dart';
import 'features/today_task/view/today_task.dart';

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
            ProfileView.id: (_) => ProfileView(),
            UpdateProfileView.id: (_) => UpdateProfileView(),
            ChangePasswordView.id: (_) => ChangePasswordView(),
            SettingView.id: (_) => SettingView(),
            TodayTask.id: (_) => TodayTask(),
            AddTask.id: (_) => AddTask(),
            EditTask.id: (_) => EditTask(),
            PersonalTask.id: (_) => PersonalTask(),
            HomeTask.id: (_) => HomeTask(),
            WorkTask.id: (_) => WorkTask(),
          },
          initialRoute: SplashView.id,
        );
      },
    );
  }
}
