import 'package:flutter/material.dart';
import 'package:to_do/core/utils/app_text_style.dart';

import 'app_colors.dart';

class AppTheme{
  static ThemeData isLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: 'LexendDeca',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.blackLight),
      titleTextStyle: AppTextStyle.fW300FS19CBlackLight,
    )
  );

  static ThemeData isDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}