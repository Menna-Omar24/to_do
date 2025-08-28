import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theme/app_colors.dart';

import '../utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style: AppTextStyle.fW300FS14CBlack,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyle.fW200FS14CGrey,
        border: borderBuilder(),
        enabledBorder: borderBuilder(),
        focusedBorder: borderBuilder(color: AppColors.primary),
        errorBorder: borderBuilder(color: AppColors.red),
        focusedErrorBorder: borderBuilder(color: AppColors.primary),
      ),
    );
  }

  InputBorder borderBuilder({Color color = AppColors.lightGrey}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: color),
      );
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 21.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        cursorWidth: 1.w,
        cursorHeight: AppSize.h23,
        cursorColor: AppColors.primary,
        obscureText: obscureText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: SizedBox(
            width: AppSize.s24,
            child: SvgPicture.asset(
              widget.icon,
              width: AppSize.s24,
              fit: BoxFit.scaleDown,
            ),
          ),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: SizedBox(
                    width: AppSize.s24,
                    child: SvgPicture.asset(
                      width: AppSize.s24,
                      obscureText ? AppAssets.lock : AppAssets.unLock,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              : null,

          hintText: widget.hintText,
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
*/
