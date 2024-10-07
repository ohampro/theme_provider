import 'package:flutter/material.dart';
import 'package:x_theme_provider/src/material_app_theme.dart';

/// This class provides a basic theme for test purpose.
class DefaultMaterialAppTheme extends MaterialAppTheme {
  // ignore: public_member_api_docs
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  // ignore: public_member_api_docs
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    useMaterial3: true,
  );

  /// Make a list of themes
  @override
  List<ThemeData> themeList() => [
        light,
        dark,
      ];
}
