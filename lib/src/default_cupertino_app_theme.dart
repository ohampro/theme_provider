import 'package:flutter/cupertino.dart';
import 'package:x_theme_provider/theme_provider.dart';

/// This class provides a basic theme for test purpose.
class DefaultCupertinoAppTheme extends AppTheme<CupertinoThemeData> {
  // ignore: public_member_api_docs
  DefaultCupertinoAppTheme() : super(light, dark);

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
}
