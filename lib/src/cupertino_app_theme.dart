import 'package:flutter/cupertino.dart';
import 'package:x_theme_provider/src/app_theme.dart';

/// Helper class for Cupertino themes.
abstract class CupertinoAppTheme extends AppTheme<CupertinoThemeData> {
  /// Return `Brightness` of your theme data class.
  @override
  Brightness? getBrightness(CupertinoThemeData themeObject) =>
      themeObject.brightness;

  @override
  CupertinoThemeData get lightTheme => const CupertinoThemeData();

  @override
  CupertinoThemeData get darkTheme => const CupertinoThemeData(
        brightness: Brightness.dark,
      );
}
