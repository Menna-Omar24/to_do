import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import '../../features/get_start/view/lets_start_view.dart';
import '../../features/get_start/view/splash_view.dart';
import '../../features/home/task/home_task.dart';
import '../../features/home/task/personal_task.dart';
import '../../features/home/task/work_task.dart';
import '../../features/home/view/home_view.dart';
import '../../features/profile/view/change_password_view.dart';
import '../../features/profile/view/profile_view.dart';
import '../../features/profile/view/setting_view.dart';
import '../../features/profile/view/update_profile_view.dart';
import '../../features/today_task/view/add_task.dart';
import '../../features/today_task/view/edit_task.dart';
import '../../features/today_task/view/today_task.dart';
import '../theme/app_theme.dart';

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
            LetsStartView.id: (_) => LetsStartView(),
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
          home: FirebaseAuth.instance.currentUser == null
              ? const LoginView()
              :  HomeView(),
        );
      },
    );
  }
}
