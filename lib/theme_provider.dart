library theme_provider;

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_service.dart';
import 'package:theme_provider/themes.dart';

typedef ThemeProviderBuilder<T> = Widget Function(T theme, T darkTheme);

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

  static ThemeService of(BuildContext context){
    return context.findAncestorStateOfType<State<ThemeProvider>>()! as ThemeService;
  }
}

class _ThemeProviderState<T> extends State<ThemeProvider<T>> with ThemeService{

  T get _lightTheme => widget.themes.light();
  T get _darkTheme => widget.themes.dark();

  @override
  void initState() {
    changeNotifier.addListener(_updateState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_theme, _darkTheme);
  }

  T get _theme {
    if (isSystem) {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.light ? _lightTheme : _darkTheme;
    }
    return isLight ? _lightTheme : _darkTheme;
  }

  @override
  void dispose() {
    changeNotifier.removeListener(_updateState);
    changeNotifier.dispose();
    super.dispose();
  }
  
  void _updateState() {
    if (mounted) setState(() {});
  }
}