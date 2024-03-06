// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comic_glance/core/helpers/global_functions.dart';
import 'package:flutter/material.dart';
import 'theme_service.dart';

class ThemeController with ChangeNotifier {
  ThemeController(
    this._themeService,
  );

  final ThemeService _themeService;

  late ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  Future<void> loadSavedThemeSettings() async {
    _themeMode = await _themeService.getThemeMode();

    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode({required String themeMode}) async {
    ThemeMode? newThemeMode = getSelectedThemeMode(themeMode);
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;

    notifyListeners();

    await _themeService.updateThemeMode(themeMode);
  }
}
