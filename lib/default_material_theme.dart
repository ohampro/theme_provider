
import 'package:flutter/material.dart';
import 'package:x_theme_provider/app_theme.dart';


class DefaultMaterialTheme {

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,

  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    useMaterial3: true,

  );

  static ThemeData of(ThemeMode mode) => AppTheme.of(mode, light, dark);
}