import 'package:flutter/material.dart';

/// Helper class for selecting theme based on mode.
abstract class AppTheme<T> {
  /// Make a list of themes
  List<T> themeList();

  /// return light theme if available
  T get lightTheme;

  /// return dark theme if available
  T get darkTheme;

  /// Return `Brightness` of your theme data class.
  Brightness? getBrightness(T themeObject);

  /// Return a name for theme
  String getName(T themeObject) => themeList().indexOf(themeObject).toString();
}
