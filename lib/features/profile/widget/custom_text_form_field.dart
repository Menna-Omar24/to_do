import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_size.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFormField({super.key, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 23 ),
      child: TextFormField(
        controller: controller,
        cursorWidth: 1.w,
        cursorHeight: AppSize.h23,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
          hintStyle: AppStyle.fW200FS14CGrey,
          border: outlineInputBorder(),
          disabledBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          errorBorder: outlineInputBorder(),
          focusedErrorBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greyLight),
    borderRadius: BorderRadius.circular(15),
  );
}
