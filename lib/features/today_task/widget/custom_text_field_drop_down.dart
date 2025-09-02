import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../data/drop_down_item_model.dart';


class CustomProfileTextFormFiled extends StatelessWidget {
  const CustomProfileTextFormFiled({
    super.key,
    required this.hint,
    this.controller,
    this.suffixIcon,
    this.onTap,
    this.isReadOnly = false,
    this.dropdownItems,
    this.onChanged,
    this.value,
  });

  final String hint;
  final String? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool isReadOnly;
  final List<DropdownItemModel>? dropdownItems;
  final void Function(String?)? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (dropdownItems != null && dropdownItems!.isNotEmpty) {
      return DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        dropdownColor: AppColors.white,
        icon: const SizedBox.shrink(),
        decoration: InputDecoration(
          hintText: hint,
          fillColor: AppColors.white,
          filled: true,
          suffixIcon: (suffixIcon != null && suffixIcon!.isNotEmpty)
              ? SizedBox(
            width: AppSize.w20,
            height: AppSize.h16,
            child: SvgPicture.asset(
              suffixIcon!,
              fit: BoxFit.scaleDown,
            ),
          )
              : null,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
          border: outlineInputBorder(),
          disabledBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          errorBorder: outlineInputBorder(),
          focusedErrorBorder: outlineInputBorder(),
        ),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        items: dropdownItems!.map((item) {
          return DropdownMenuItem<String>(
            value: item.title,
            child: Row(
              children: [
                item.icon,
                const SizedBox(width: 8),
                Text(item.title),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return TextFormField(
        controller: controller,
        readOnly: isReadOnly || onTap != null,
        onTap: onTap,
        cursorHeight: 13,
        cursorColor: AppColors.black,
        cursorWidth: 1,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          fillColor: AppColors.white,
          filled: true,
          suffixIcon: (suffixIcon != null && suffixIcon!.isNotEmpty)
              ? SizedBox(
            width: AppSize.w20,
            height: AppSize.h16,
            child: SvgPicture.asset(
              suffixIcon!,
              fit: BoxFit.scaleDown,
            ),
          )
              : null,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
          border: outlineInputBorder(),
          disabledBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          errorBorder: outlineInputBorder(),
          focusedErrorBorder: outlineInputBorder(),
        ),
      );
    }
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey),
    borderRadius: BorderRadius.circular(15),
  );
}