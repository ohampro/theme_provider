import 'dart:math';

import 'package:flutter/material.dart'
    show Brightness, ThemeMode, ValueNotifier, WidgetsBinding;
import 'package:x_theme_provider/src/app_theme.dart';

/// ThemeService provides methods for managing and changing themes and mode.
mixin ThemeService {
  static const int _systemMode = -1;

  /// Use it to listen to the changes.
  final ValueNotifier<int> changeNotifier = ValueNotifier(_systemMode);

  /// list of available themes.
  AppTheme get appTheme;

  /// list of the available themes in AppTheme, or defaultTheme if themeList is empty.
  List get themes => appTheme.themeList().isNotEmpty
      ? appTheme.themeList()
      : [appTheme.lightTheme, appTheme.darkTheme];

  int _index = _systemMode;

  /// current theme index
  int get index => _index;

  set index(int value) {
    _index = value.clamp(_systemMode, max(0, themes.length - 1));
    changeNotifier.value = _index;
  }

  /// set theme to the next item.
  void next() => index = (index + 1) % themes.length;

  /// set theme to the previous item.
  void previous() => index = (index - 1) % themes.length;

  /// set to `systemMode`, it means no theme is selected by user and theme `index` is -1
  void system() => index = _systemMode;

  /// get current theme based on the `index`
  T theme<T>() {
    int tIndex = _index;
    List list = themes;

    if (isSystem) {
      if (ThemeService.isDarkSystem) {
        if (appTheme.darkTheme != null) {
          return appTheme.darkTheme;
        }

        tIndex = _indexOfBrightness(Brightness.dark);
      } else {
        if (appTheme.lightTheme != null) {
          return appTheme.lightTheme;
        }

        tIndex = _indexOfBrightness(Brightness.light);
      }
    }

    tIndex = tIndex.clamp(0, max(0, list.length - 1));

    return list[tIndex];
  }

  /// checks if current mode is `systemMode`
  bool get isSystem => index <= _systemMode;

  /// check if system is dark mode,
  /// system can be dark mode while your app is using a light theme,
  /// in this case `isDark` returns `false` but `isDarkSsytem` returns `true`
  static bool get isDarkSystem {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  // return theme index of reuested brightness if available, or -1
  int _indexOfBrightness(Brightness brightness) =>
      themes.indexWhere((test) => appTheme.getBrightness(test) == brightness);

  /// toggle mode between light and dark theme.
  /// if these are defined using `AppTheme.darkTheme` and `AppTheme.lightTheme` cool. if not
  /// the first light and first dark theme in the `themeList` will be used.
  void toggle() {
    if (!isDark) {
      dark();
    } else if (!isLight) {
      light();
    }
  }

  /// find light theme and set it.
  /// it first looks for `AppTheme.lightTheme` if is set and present in the `AppTheme.ThemeList`, if not
  /// then searches in `ThemeList` for first theme with `Brightness.light`. if nothing found then it does nothing.
  void light() => _tryMode(appTheme.lightTheme, Brightness.light);

  /// find dark theme and set it.
  /// it first looks for `AppTheme.darkTheme` if is set and present in the `AppTheme.ThemeList`, if not
  /// then searches in `ThemeList` for first theme with `Brightness.dark`. if nothing found then it does nothing.
  void dark() => _tryMode(appTheme.darkTheme, Brightness.dark);

  void _tryMode(dynamic mTheme, Brightness defaultBrightness) {
    int mIndex = _indexOfTheme(mTheme);

    if (mIndex == -1) {
      mIndex = _indexOfBrightness(defaultBrightness);
    }

    if (mIndex > -1) {
      index = mIndex;
    }
  }

  // return index of reuested theme if available, or -1
  int _indexOfTheme(dynamic defaultTheme) =>
      themes.indexWhere((test) => test == defaultTheme);

  /// checks if current theme is light
  bool get isLight => !isDark;

  /// checks if current theme is dark
  bool get isDark {
    final list = themes;

    if (list.isNotEmpty && index > _systemMode && index < list.length) {
      final brightness = appTheme.getBrightness(list[index]);

      if (brightness == Brightness.dark) {
        return true;
      } else if (brightness == Brightness.light) {
        return false;
      }
    }

    return isDarkSystem;
  }

  /// return the name of current theme if implemented using `AppTheme.getName`
  String get name => appTheme.getName(theme());

  /// return the current ThemeMode
  ThemeMode get mode => modeOf(_index);

  /// Returns the ThemeMode of a theme by index.
  ThemeMode modeOf(int index) => isSystem
      ? ThemeMode.system
      : appTheme.getBrightness(themes[index]) == Brightness.light
          ? ThemeMode.light
          : appTheme.getBrightness(themes[index]) == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.system;
}
