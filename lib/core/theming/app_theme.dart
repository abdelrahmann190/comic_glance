import 'package:comic_glance/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Light Theme Custom Settings
  static ThemeData light() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      dividerColor: AppColorsManager.lightGrey,
      primaryColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: AppColorsManager.lightGrey,
      ),
    );
  }

  /// Dark Theme Custom Settings
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      dividerColor: AppColorsManager.superDarkGrey,
      primaryColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: AppColorsManager.superDarkGrey,
      ),
    );
  }
}
