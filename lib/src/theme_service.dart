import 'package:flutter/material.dart' show ValueNotifier;
import 'package:x_theme_provider/src/app_theme.dart';

/// ThemeService provides methods for managing and changing mode.
mixin ThemeService {

  /// System mode
  static const int systemMode = -1;

  /// System mode
  static const int lightMode = 0;

  /// System mode
  static const int darkMode = 1;

  int _mode = systemMode;

  /// current mode
  int get mode => _mode;

  /// list of available themes.
  AppTheme get themes;

  set mode(int mode) {
    _mode = mode;
    _changeNotifier.value = mode;
  }

  /// checks if current mode is `lightMode`
  bool get isLight => _mode == lightMode;

  /// checks if current mode is `darkMode`
  bool get isDark => _mode == darkMode;

  /// checks if current mode is `systemMode`
  bool get isSystem => _mode == systemMode;

  final ValueNotifier<int> _changeNotifier =
      ValueNotifier(systemMode);

  /// Use it to listen to the mode changes.
  ValueNotifier<int> get changeNotifier => _changeNotifier;

  /// toggle mode between light and dark.
  void toggle() {
    if (_mode != darkMode) {
      mode = darkMode;
      return;
    }

    if (_mode != lightMode) {
      mode = lightMode;
    }
  }

  /// set mode to `lightMode`
  void light() => mode = lightMode;

  /// set mode to `darkMode`
  void dark() => mode = darkMode;

  /// set mode to `systemMode`
  void system() => mode = systemMode;

  /// set mode to the next item.
  void next() => mode = (mode + 1) % themes.length;

  /// set mode to the previous item.
  void previous() => mode = (mode - 1) % themes.length;

  /// return the name of current mode
  String get name => themes.nameOf(mode);
}
