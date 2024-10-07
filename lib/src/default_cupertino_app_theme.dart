import 'package:flutter/cupertino.dart';
import 'package:x_theme_provider/src/cupertino_app_theme.dart';

/// This class provides a basic theme for test purpose.
class DefaultCupertinoAppTheme extends CupertinoAppTheme {
  // ignore: public_member_api_docs
  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.white,
    primaryColor: CupertinoColors.systemBlue,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
    ),
  );

  // ignore: public_member_api_docs
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.black,
    primaryColor: CupertinoColors.systemYellow,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
    ),
  );

  /// Make a list of themes
  @override
  List<CupertinoThemeData> themeList() => [
        light,
        dark,
      ];
}
