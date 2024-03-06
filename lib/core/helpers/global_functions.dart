import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:flutter/material.dart';

ThemeMode? getSelectedThemeMode(String selectedThemeMode) {
  switch (selectedThemeMode) {
    case AppStrings.lightThemeMode:
      return ThemeMode.light;
    case AppStrings.darkThemeMode:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
