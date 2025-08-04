import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static ThemeData isLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: 'LexendDeca',
  );

  static ThemeData isDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}