import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        controller: controller,
        cursorWidth: 1.w,
        cursorHeight: AppSize.h23,
        cursorColor: AppColors.primary,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
          hintStyle: AppTextStyle.fW200FS14CGrey,
          suffixIcon: suffixIcon != null
              ? SizedBox(
            width: AppSize.w18_76,
            height: AppSize.h19_22,
            child: SvgPicture.asset(
              suffixIcon!,
              fit: BoxFit.scaleDown,
            ),
          )
              : null,
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
    borderSide: BorderSide(color: AppColors.lightGrey),
    borderRadius: BorderRadius.circular(15),
  );
}
