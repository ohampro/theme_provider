import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';

class InheritedThemeProvider extends InheritedWidget{
  final ThemeMode mode;

  const InheritedThemeProvider(this.mode, {super.key, required super.child});

  static InheritedThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedThemeProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedThemeProvider oldWidget) {
    return mode != oldWidget.mode;
  }
}