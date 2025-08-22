import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_text_style.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSize.h63_8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(20.0),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: AppSize.w16),
              Text(title, style: AppTextStyle.fW400FS16CBlackLight),
              Spacer(),
              SvgPicture.asset(AppAssets.arrow),
            ],
          ),
        ),
      ),
    );
  }
}
