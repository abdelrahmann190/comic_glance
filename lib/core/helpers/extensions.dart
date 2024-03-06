import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension AppTheme on BuildContext {
  ThemeData get appTheme {
    return Theme.of(this);
  }
}

extension StringExtensions on String {
  /// Returns the string with the first letter capitalized.
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } else {
      return this;
    }
  }

  /// Returns the string with the first letter of each word capitalized.
  String capitalizeWords() {
    return split(" ").map((str) => str.capitalize()).join(" ");
  }
}
