import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_theme_provider/src/default_material_theme.dart';
import 'package:x_theme_provider/src/theme_service.dart';
import 'helpers/my_app.dart';

void main() {
  group('ThemeService', (){
    late ThemeServiceTestClass themeService;

    setUp(() {
      themeService = ThemeServiceTestClass();
    });

    test('should init with system mode', (){
      expect(themeService.mode, ThemeService.systemMode);
    });

    test('should change mode when requested', (){
      themeService.mode = ThemeService.darkMode;
      expect(themeService.mode, ThemeService.darkMode);

      themeService.mode = ThemeService.systemMode;
      expect(themeService.mode, ThemeService.systemMode);
    });
  });

  group('ThemeProvider', (){

    testWidgets('Widget Should be intuitive and easy to use', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      expect(find.text(Brightness.light.toString()), findsOneWidget);
    });

    testWidgets('Toggle mode should show dark mode and vise versa', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act 1
      // toogle to dark
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.dark.toString()), findsOneWidget);

      // Act 2
      // toogle to light
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.light.toString()), findsOneWidget);
    });

    testWidgets('next mode should show light, then dark, then system, then light again', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act 1
      // system to light
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.light.toString()), findsOneWidget);
      expect(find.text('Mode: ${DefaultMaterialTheme().nameOf(ThemeService.lightMode)}'), findsOneWidget);

      // Act 2
      // light to dark
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.dark.toString()), findsOneWidget);
      expect(find.text('Mode: ${DefaultMaterialTheme().nameOf(ThemeService.darkMode)}'), findsOneWidget);

      // Act 3
      // dark to light again
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.light.toString()), findsOneWidget);
      expect(find.text('Mode: ${DefaultMaterialTheme().nameOf(ThemeService.lightMode)}'), findsOneWidget);

      // Act 4
      // light to system
      await tester.tap(find.byKey(systemModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Mode: ${DefaultMaterialTheme().nameOf(ThemeService.systemMode)}'), findsOneWidget);
    });
  });
}