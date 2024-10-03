import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:theme_provider/theme_service.dart';

void main() {
  group('ThemeService', (){
    late ThemeService themeService;

    setUp(() {
      themeService = ThemeService();
    });

    test('should init with light theme', (){
      expect(themeService.mode, ThemeMode.system);
    });

    test('should change mode when requested', (){
      themeService.mode = ThemeMode.dark;
      expect(themeService.mode, ThemeMode.dark);

      themeService.mode = ThemeMode.system;
      expect(themeService.mode, ThemeMode.system);
    });
  });

}