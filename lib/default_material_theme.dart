
import 'package:flutter/material.dart';
import 'package:theme_provider/app_theme.dart';

class DefaultAppTheme extends AppTheme<ThemeData>{
  const DefaultAppTheme();

  @override
  ThemeData light() => DefaultMaterialTheme.light;

  @override
  ThemeData dark() => DefaultMaterialTheme.dark;
  
}

class DefaultMaterialTheme{

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
}