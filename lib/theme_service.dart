
import 'package:flutter/material.dart';

class ThemeService {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
  }
}