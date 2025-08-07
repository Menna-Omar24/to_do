import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Color bgTextColor;
  final String textIcon;
  final Color textColor;
  final String icon;
  final Color bgIcon;

  const CustomCard({
    super.key,
    required this.title,
    required this.bgTextColor,
    required this.textIcon,
    required this.icon,
    required this.bgIcon,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(7.r),
          child: Image.asset(
            AppAssets.auth,
            width: 60.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
        ),
        title: Padding(
          padding: REdgeInsets.only(top: 15),
          child: Text(title, style: AppStyle.fW300FS14CBlack),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: REdgeInsets.only(bottom: 15),
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    color: bgTextColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    textIcon,
                    style: TextStyle(color: textColor),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Padding(
                padding: REdgeInsets.only(bottom: 15),
                child: Container(
                  width: AppSize.w22,
                  height: AppSize.h22,
                  decoration: BoxDecoration(
                    color: bgIcon,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: SizedBox(
                    width: AppSize.w12,
                    child: SvgPicture.asset(
                      icon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
