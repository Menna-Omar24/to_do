import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icons;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: AppColors.white,
          prefixIcon: Icon(icons),
          suffixIcon: Icon(Icons.remove_red_eye),
          hintText: hintText,
          hintStyle: AppStyle.fW200FS14CGrey,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.greyLight),
          ),
        ),
      ),
    );
  }
}
