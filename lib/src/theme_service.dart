import 'package:flutter/material.dart';

/// ThemeService provides methods for managing and changing mode.
mixin ThemeService {
  ThemeMode _mode = ThemeMode.system;

  /// current mode
  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    _changeNotifier.value = mode;
  }

  /// checks if current mode is `ThemeMode.light`
  bool get isLight => _mode == ThemeMode.light;

  /// checks if current mode is `ThemeMode.dark`
  bool get isDark => _mode == ThemeMode.dark;

  /// checks if current mode is `ThemeMode.system`
  bool get isSystem => _mode == ThemeMode.system;

  final ValueNotifier<ThemeMode> _changeNotifier =
      ValueNotifier(ThemeMode.system);

  /// Use it to listen to the mode changes.
  ValueNotifier<ThemeMode> get changeNotifier => _changeNotifier;

  /// toggle mode between light and dark.
  void toggle() {
    if (_mode != ThemeMode.dark) {
      mode = ThemeMode.dark;
      return;
    }

    if (_mode != ThemeMode.light) {
      mode = ThemeMode.light;
    }
  }

  /// set mode to `ThemeMode.light`
  void light() => mode = ThemeMode.light;

  /// set mode to `ThemeMode.dark`
  void dark() => mode = ThemeMode.dark;

  /// set mode to `ThemeMode.system`
  void system() => mode = ThemeMode.system;

  /// set mode to the next item in ThemeMode cycle.
  void next() {
    final nextIndex = (_mode.index + 1) % ThemeMode.values.length;
    mode = ThemeMode.values[nextIndex];
  }

  /// set mode to the previous item in ThemeMode cycle.
  void previous() {
    final previousIndex = (_mode.index - 1) % ThemeMode.values.length;
    mode = ThemeMode.values[previousIndex];
  }
}
