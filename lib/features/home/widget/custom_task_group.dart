import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_text_style.dart';

class CustomTaskGroup extends StatelessWidget {
  final String title;
  final String icon;
  final Color iconColor;

  final int num;
  final Color color;
  final Color textColor;

  final void Function()? onTap;

  const CustomTaskGroup({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.num,
    required this.color,
    required this.textColor, this.onTap,
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
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: AppSize.w35,
                height: AppSize.h35,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SizedBox(
                  width: AppSize.w19,
                  height: AppSize.h21,
                  child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
                ),
              ),
              SizedBox(width: AppSize.w11),
              Text(title, style: AppTextStyle.fW300FS14CBlackLight),
              Spacer(),
              Container(
                width: AppSize.w22,
                height: AppSize.h23,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    '$num',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
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
