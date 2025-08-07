import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

class AppTheme{
  static ThemeData isLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: 'LexendDeca',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.blackLight),
      titleTextStyle: AppStyle.fW300FS19CBlackLight,
    )
  );

  static ThemeData isDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}