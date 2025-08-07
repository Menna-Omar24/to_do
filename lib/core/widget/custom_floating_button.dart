import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../utils/app_size.dart';

class CustomFloatingButton extends StatelessWidget {

  final String icon;
  final VoidCallback onPressed;

  const CustomFloatingButton(
      {super.key, required this.icon, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      backgroundColor: AppColors.primary,
      onPressed:onPressed,
      child: SvgPicture.asset(icon, width: AppSize.s24),
    );
  }
}
