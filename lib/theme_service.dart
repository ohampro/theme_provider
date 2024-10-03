
import 'package:flutter/material.dart';

mixin ThemeService {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    _changeNotifier.value = mode;
  }

  bool get isLight => _mode == ThemeMode.light;
  bool get isDark => _mode == ThemeMode.dark;
  bool get isSystem => _mode == ThemeMode.system;

  final ValueNotifier<ThemeMode> _changeNotifier = ValueNotifier(ThemeMode.system);
  ValueNotifier<ThemeMode> get changeNotifier => _changeNotifier;

  void toggle() {
    if (_mode != ThemeMode.dark) {
      mode = ThemeMode.dark;
      return;
    }
    
    if (_mode != ThemeMode.light){
      mode = ThemeMode.light;
    }
  }
  
}