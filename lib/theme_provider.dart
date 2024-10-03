library theme_provider;

import 'package:flutter/widgets.dart';
import 'package:theme_provider/themes.dart';

typedef ThemeProviderBuilder<T> = Widget Function(BuildContext context, T theme, T darkTheme);

class ThemeProvider<T> extends StatefulWidget{
  final AppThemes<T> themes;
  final ThemeProviderBuilder<T> builder;

  const ThemeProvider({
    super.key, 
    required this.themes,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _ThemeProviderState<T>();

}

class _ThemeProviderState<T> extends State<ThemeProvider<T>>{

  T get _lightTheme => widget.themes.light();
  T get _darkTheme => widget.themes.dark();

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lightTheme, _darkTheme);
  }

}