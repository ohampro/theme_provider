import 'package:flutter/material.dart';
import 'package:x_theme_provider/src/app_theme.dart';

/// Base class for Material themes.
abstract class MaterialAppTheme extends AppTheme<ThemeData> {
  /// Return `Brightness` of your theme data class.
  @override
  Brightness? getBrightness(ThemeData themeObject) => themeObject.brightness;

  @override
  ThemeData get lightTheme => ThemeData.light();

  @override
  ThemeData get darkTheme => ThemeData.dark();
}
