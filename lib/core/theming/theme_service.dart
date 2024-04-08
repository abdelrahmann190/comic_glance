import 'package:comic_glance/core/helpers/app_shared_preferences.dart';
import 'package:comic_glance/core/helpers/global_functions.dart';
import 'package:flutter/material.dart';

/// A service that stores and retrieves user settings.

class ThemeService {
  final AppSharedPrefereneces _appSharedPrefereneces;

  ThemeService(this._appSharedPrefereneces);

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode?> getThemeMode() async {
    final savedThemeMode = _appSharedPrefereneces.getAppThemeMode();

    return getSelectedThemeMode(savedThemeMode);
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(String themeMode) async {
    await _appSharedPrefereneces.setAppThemeMode(themeMode);
  }
}
