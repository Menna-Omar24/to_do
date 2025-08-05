import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/app_size.dart';

import '../theme/app_style.dart';

class CustomElevatedButton extends StatelessWidget {

  final String titleElevatedButton;
  final void Function()? onTap;

  const CustomElevatedButton(
      {super.key, required this.titleElevatedButton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: AppSize.h48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.r14),
          boxShadow: [BoxShadow(
            color: AppColors.primary,
            offset: Offset(0, 5),
            blurRadius: AppSize.blur10,
            blurStyle: BlurStyle.normal,
            spreadRadius: AppSize.sp,
          )
          ],
          color: AppColors.primary,
        ),
        child: Center(child: Text(
          titleElevatedButton, style: AppStyle.fW300FS19CWhite,)),
      ),
    );
  }
}
