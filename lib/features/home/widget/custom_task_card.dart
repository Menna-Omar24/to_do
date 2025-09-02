import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_size.dart';

class CustomTaskCard extends StatelessWidget {
  final String title;
  final Color colorTitle;
  final String subtitle;
  final Color colorSubtitle;
  final String icon;
  final Color iconColor;
  final Color color;

  const CustomTaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.colorTitle,
    required this.colorSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w234,
      height: AppSize.h90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 17, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(color: colorTitle)),
                Container(
                  width: AppSize.w22,
                  height: AppSize.h22,
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: SizedBox(
                    width: AppSize.w12,
                    height: AppSize.h12,
                    child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.h13),
            Text(subtitle, style: TextStyle(color: colorSubtitle)),
          ],
        ),
      ),
    );
  }
}
