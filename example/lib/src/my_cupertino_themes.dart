
import 'package:flutter/cupertino.dart';
import 'package:x_theme_provider/theme_provider.dart';

final themes = <AppTheme<CupertinoThemeData>>[
  DefaultCupertinoAppTheme(),
  Blue(),
  Orange(),
  Purple(),
  Green(),
];

class Blue extends AppTheme<CupertinoThemeData> {
  // ignore: public_member_api_docs
  Blue() : super(light, dark);

  @override
  String get name => 'Blue';

  // ignore: public_member_api_docs
  static const CupertinoThemeData light = CupertinoThemeData(
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    primaryColor: CupertinoColors.activeBlue,
    barBackgroundColor: CupertinoColors.lightBackgroundGray,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.activeBlue,
        fontSize: 16,
      ),
    ),
  );

  // ignore: public_member_api_docs
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    primaryColor: CupertinoColors.activeBlue,
    barBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.activeBlue,
        fontSize: 16,
      ),
    ),
  );
}

class Orange extends AppTheme<CupertinoThemeData>{
  Orange() : super (light, dark);
  
  @override
  String get name => 'Orange';

  // ignore: public_member_api_docs
  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    primaryColor: CupertinoColors.systemOrange,
    barBackgroundColor: CupertinoColors.systemGrey5,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.darkBackgroundGray,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemOrange,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemOrange,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // ignore: public_member_api_docs
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.black,
    primaryColor: CupertinoColors.systemOrange,
    barBackgroundColor: CupertinoColors.systemGrey6,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        color: CupertinoColors.systemGrey4,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemOrange,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemOrange,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class Purple extends AppTheme<CupertinoThemeData>{
  Purple() : super (light, dark);
  
  @override
  String get name => 'Purple';

  // ignore: public_member_api_docs
  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    primaryColor: CupertinoColors.systemPurple,
    barBackgroundColor: CupertinoColors.systemGrey6,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // ignore: public_member_api_docs
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.black,
    primaryColor: CupertinoColors.systemPurple,
    barBackgroundColor: CupertinoColors.systemGrey5,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        color: CupertinoColors.systemGrey4,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemPurple,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class Green extends AppTheme<CupertinoThemeData>{
  Green() : super (light, dark);
  
  @override
  String get name => 'Green';

  // ignore: public_member_api_docs
  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    primaryColor: CupertinoColors.systemGreen,
    barBackgroundColor: CupertinoColors.systemGrey6,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // ignore: public_member_api_docs
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.black,
    primaryColor: CupertinoColors.systemGreen,
    barBackgroundColor: CupertinoColors.systemGrey5,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        color: CupertinoColors.systemGrey4,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navActionTextStyle: TextStyle(
        color: CupertinoColors.systemGreen,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}