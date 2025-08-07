import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/app_style.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/features/profile/view/profile_view.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/default_app_bar.dart';

class SettingView extends StatelessWidget {
  static String id = AppRoute.settings;

  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          title: AppString.settings,
          onTap: () {
            Navigator.pushNamed(context, ProfileView.id);
          },
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Row(
          children: [
            Text(AppString.language, style: AppStyle.fW300FS20CBlackLight),
            Spacer(),
            Container(
              width: AppSize.w51,
              height: AppSize.h36,
              decoration: BoxDecoration(color: AppColors.greyLight),
              child: Center(
                child: Text('AR', style: AppStyle.fW300FS20CBlackLight),
              ),
            ),
            Container(
              width: AppSize.w51,
              height: AppSize.h36,
              decoration: BoxDecoration(color: AppColors.primary),
              child: Center(child: Text('EN', style: AppStyle.fW300FS20CWhite)),
            ),
          ],
        ),
      ),
    );
  }
}
