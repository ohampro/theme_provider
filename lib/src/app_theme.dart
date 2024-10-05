import 'package:flutter/material.dart';

/// Helper class for selecting theme based on ThemeMode.
final class AppTheme {
  AppTheme._internal();

  /// Returns the appropriate theme based on the selected mode.
  static T of<T>(ThemeMode mode, T light, T dark) {
    if (mode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.light ? light : dark;
    }
    return mode == ThemeMode.light ? light : dark;
  }
}
