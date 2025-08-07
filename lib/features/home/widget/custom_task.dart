import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.h135,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.desYourTodayTasks,
              style: AppStyle.fW400FS14CWhite,
            ),
            SizedBox(height: AppSize.h4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: '80',
                    style: AppStyle.fW500FS40CWhite,
                    children: [
                      TextSpan(text: '%', style: AppStyle.fW500FS24CWhite),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    AppString.viewTasks,
                    style: AppStyle.fW400FS15CPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
