import 'package:flutter/material.dart';
import 'package:x_theme_provider/src/theme_service.dart';

/// Helper class for selecting theme based on mode.
abstract class AppTheme<T> {
  /// Make a list of themes
  @protected
  List<T> themeList();

  /// This method is used to create `themeList()`
  /// Make sure to use this.
  @protected
  List<T> from(T light, T dark, {List<T> rest = const []}) {
    return [light, dark, ...rest];
  }

  /// Returns theme based on the selected mode.
  T of(int mode) {
    if (mode == ThemeService.systemMode) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      mode = brightness == Brightness.light
          ? ThemeService.lightMode
          : ThemeService.darkMode;
    }

    return themeList()[mode];
  }

  /// Returns theme name by mode.
  String nameOf(int mode) => mode == ThemeService.systemMode
      ? 'System'
      : mode == ThemeService.lightMode
          ? 'Light'
          : mode == ThemeService.darkMode
              ? 'Dark'
              : mode.toString();

  /// length of themes in this AppTheme.
  int get length => themeList().length;
}
