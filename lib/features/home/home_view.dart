import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_string.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_style.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/route.dart';
import '../../core/widget/custom_appbar.dart';
import '../profile/view/profile_view.dart';

class HomeView extends StatelessWidget {
  static String id = AppRoute.home;

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: SvgPicture.asset(AppAssets.plus, width: AppSize.s24),
      ),
      body: Padding(
        padding: REdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                userName: userName,
                onTap: () {
                  Navigator.pushNamed(context, ProfileView.id,
                      arguments: userName);
                },
              ),
              SizedBox(height: AppSize.h48),
              Text(
                AppString.desHome,
                style: AppStyle.fW300FS16CBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.h63_8),
              SvgPicture.asset(AppAssets.home),
            ],
          ),
        ),
      ),
    );
  }
}
