import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/my_app.dart';

void main() {
  group('ThemeService', (){
    late ThemeServiceTestClass themeService;

    setUp(() {
      themeService = ThemeServiceTestClass();
    });

    test('should init with system mode', (){
      expect(themeService.isSystem, true);
    });

    test('should change mode when requested', (){
      themeService.dark();
      expect(themeService.isDark, true);

      themeService.light();
      expect(themeService.isLight, true);

      themeService.system();
      expect(themeService.isSystem, true);
    });
  });

  group('ThemeProvider', (){

    testWidgets('Widget Should be intuitive and easy to use', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp()); // intuitive MyApp

      expect(find.text(kLightBrightnessString), findsOneWidget);
    });

    testWidgets('Toggle mode should show dark mode and vise versa', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act 1
      // toogle to dark
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kDarkBrightnessString), findsOneWidget);

      // Act 2
      // toogle to light
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
    });

    testWidgets('next mode should show light, then dark, then system, then light again', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act 1
      // system to light
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.light.toString()}'), findsOneWidget);

      // Act 2
      // light to dark
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kDarkBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.dark.toString()}'), findsOneWidget);

      // Act 3
      // dark to light again
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.light.toString()}'), findsOneWidget);

      // Act 4
      // light to system
      await tester.tap(find.byKey(systemModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Mode: ${ThemeMode.system.toString()}'), findsOneWidget);
    });
  });
}

String get kLightBrightnessString => 'Brightness: ${Brightness.light.toString()}';
String get kDarkBrightnessString => 'Brightness: ${Brightness.dark.toString()}';