import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/app_size.dart';

class CustomEleBtn extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomEleBtn({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.h48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.primary,
          backgroundColor: AppColors.primary,
          shadowColor: AppColors.primary,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w300,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
