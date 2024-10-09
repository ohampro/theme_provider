
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

final themes = <AppTheme<ThemeData>>[
  DefaultMaterialAppTheme(),
  Blue(),
  Orange(),
  Purple(),
];

class Blue extends AppTheme<ThemeData>{
  Blue() : super (light, dark);
  
  @override
  String get name => 'Blue';

  // ignore: public_member_api_docs
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  );

  // ignore: public_member_api_docs
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}

class Orange extends AppTheme<ThemeData>{
  Orange() : super (light, dark);
  
  @override
  String get name => 'Orange';

  // ignore: public_member_api_docs
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
    useMaterial3: true,
  );

  // ignore: public_member_api_docs
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}

class Purple extends AppTheme<ThemeData>{
  Purple() : super (light, dark);
  
  @override
  String get name => 'Purple';

  // ignore: public_member_api_docs
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    useMaterial3: true,
  );

  // ignore: public_member_api_docs
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}