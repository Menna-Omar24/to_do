import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_string.dart';
import 'package:to_do/features/profile/view/setting_view.dart';
import 'package:to_do/features/profile/view/update_profile_view.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/widget/custom_appbar.dart';
import '../widget/custom_container.dart';
import 'change_password_view.dart';

class ProfileView extends StatelessWidget {
  static String id = AppRoute.profile;

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppbar(userName: userName),
              SizedBox(height: AppSize.h37),
              CustomContainer(
                title: AppString.profile,
                icon: AppAssets.profileOutline,
                onTap: () {
                  Navigator.pushNamed(context, UpdateProfileView.id);
                },
              ),
              SizedBox(height: AppSize.h25),
              CustomContainer(
                title: AppString.changePassword,
                icon: AppAssets.lock,
                onTap: () {
                  Navigator.pushNamed(context, ChangePasswordView.id);
                },
              ),
              SizedBox(height: AppSize.h25),
              CustomContainer(
                title: AppString.settings,
                icon: AppAssets.setting,
                onTap: () {
                  Navigator.pushNamed(context, SettingView.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
