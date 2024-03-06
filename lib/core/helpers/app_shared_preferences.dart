import 'package:comic_glance/core/consts/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefereneces {
  final SharedPreferences _sharedPreferences;

  AppSharedPrefereneces(this._sharedPreferences);

  String getAppThemeMode() {
    final themeMode = _sharedPreferences.getString(AppStrings.themeModeKey);
    if (themeMode == null || themeMode.isEmpty) {
      return AppStrings.systemThemeMode;
    } else {
      return themeMode;
    }
  }

  Future<void> setAppThemeMode(String themeMode) async {
    await _sharedPreferences.setString(AppStrings.themeModeKey, themeMode);
  }
}
