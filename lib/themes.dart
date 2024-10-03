
import 'package:flutter/material.dart';

abstract class AppThemes<T>{
  T light();
  T dark();
}

class DefaultMaterialAppThemes implements AppThemes<ThemeData>{
  const DefaultMaterialAppThemes();
  
  @override
  ThemeData light() => _light;

  @override
  ThemeData dark() => _dark;

  static final ThemeData _light = ThemeData(
    brightness: Brightness.light,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,

  );

  static final ThemeData _dark = ThemeData(
    brightness: Brightness.dark,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    useMaterial3: true,

  );
}