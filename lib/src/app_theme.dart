import 'package:flutter/material.dart';

final class AppTheme {
  AppTheme._internal();

  static T of<T>(ThemeMode mode, T light, T dark) {
    if (mode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.light ? light : dark;
    }
    return mode == ThemeMode.light ? light : dark;
  }
}
