import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart'
    show Brightness, ThemeMode, ValueNotifier, WidgetsBinding;
import 'package:x_theme_provider/src/app_theme.dart';

/// ThemeService provides methods for managing and changing themes and mode.
mixin ThemeService {
  /// current theme.
  AppTheme? get fixedTheme;

  /// list of available themes.
  List<AppTheme>? get themes;

  /// Use it to listen to the changes.
  final ValueNotifier<String> changeNotifier = ValueNotifier('');

  ThemeMode _mode = ThemeMode.system;

  /// current mode
  ThemeMode get mode => _mode;

  set mode(ThemeMode value) {
    _mode = value;
    changeNotifier.value = 'mode:$value';
  }

  int _index = 0;

  /// current theme index, it has no effect if `theme` property is set.
  int get index => _index;

  /// theme index in `themes` list.
  /// it does nothing if `themes` is empty or `theme` property is set.
  /// it also clamps the value between 0 and themes.length.
  set index(int value) {
    if (themes == null || themes!.isEmpty) {
      return;
    }

    _index = value.clamp(0, max(0, themes!.length - 1));
    changeNotifier.value = 'index:$_index';
  }

  /// set theme to the next item.
  void next() {
    if (themes == null || themes!.isEmpty) {
      return;
    }

    index = (index + 1) % themes!.length;
  }

  /// set theme to the previous item.
  void previous() {
    if (themes == null || themes!.isEmpty) {
      return;
    }

    index = (index - 1) % themes!.length;
  }

  /// get current theme based on the `index`
  T theme<T>() {
    late AppTheme appTheme;

    if (fixedTheme != null) {
      appTheme = fixedTheme!;
    } else if (themes != null && themes!.isNotEmpty) {
      appTheme = themes![index];
    } else {
      throw ArgumentError('Either theme or themes must be provided');
    }

    ThemeMode finalMode = mode;

    if (isSystem) {
      finalMode = ThemeService.isDarkSystem ? ThemeMode.dark : ThemeMode.light;
    }

    if (finalMode == ThemeMode.dark) {
      return appTheme.darkTheme();
    } else {
      return appTheme.lightTheme();
    }
  }

  /// check if system is dark mode,
  /// system can be dark mode while your app is using a light theme,
  /// in this case `isDark` returns `false` but `isDarkSsytem` returns `true`
  static bool get isDarkSystem {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  /// toggle mode between light and dark theme.
  void toggle() {
    if (!isDark) {
      dark();
    } else if (!isLight) {
      light();
    }
  }

  /// set mode to `ThemeMode.system`
  void system() => mode = ThemeMode.system;

  /// set mode to `ThemeMode.light`
  void light() => mode = ThemeMode.light;

  /// set mode to `ThemeMode.dark`
  void dark() => mode = ThemeMode.dark;

  /// checks if current mode is `systemMode`
  bool get isSystem => mode == ThemeMode.system;

  /// checks if current mode is light
  bool get isLight => mode == ThemeMode.light;

  /// checks if current mode is dark
  bool get isDark => mode == ThemeMode.dark;

  /// returns json string for persisting purpose.
  String get jsonString {
    final jsonMap = {
      'mode': _mode.index,
      'index': _index,
    };

    return json.encode(jsonMap);
  }

  /// set state from a valid jsonString.
  /// this method is better to be called before `changeNotifier.addListener`.
  void fromJsonString(String string) {
    Map<String, dynamic> jsonMap = json.decode(string);
    _mode = _toThemeMode(jsonMap['mode']);
    index = jsonMap['index'];
  }

  ThemeMode _toThemeMode(int value) => value == ThemeMode.light.index
      ? ThemeMode.light
      : value == ThemeMode.dark.index
          ? ThemeMode.dark
          : ThemeMode.system;
}
