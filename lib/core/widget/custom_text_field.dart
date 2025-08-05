import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_style.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false, this.controller, this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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

  OutlineInputBorder outlineInputBorder() =>
      OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyLight),
        borderRadius: BorderRadius.circular(15),
      );
}
