import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_size.dart';

class CustomRowText extends StatelessWidget {
  final String title;
  final int num;

  const CustomRowText({super.key, required this.title, required this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 26,),
      child: Row(
        children: [
          Text(title, style: AppStyle.fW300FS14CBlackLight),
          SizedBox(width: AppSize.w30),
          Container(
            width: AppSize.w14,
            height: AppSize.h15,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: Text('$num', style: AppStyle.fW400FS12CPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
