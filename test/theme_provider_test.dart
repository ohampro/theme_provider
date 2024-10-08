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

    test('should init with init property', (){
      themeService.fromJsonString('{"mode":${ThemeMode.light.index},"index":2}');

      expect(themeService.isLight, true);
      expect(themeService.index, 2);
    });

    test('should create jsonString properly', (){
      themeService.light();
      themeService.index = 2;

      expect(themeService.isLight, true);
      expect(themeService.index, 2);
      expect(themeService.jsonString, '{"mode":${ThemeMode.light.index},"index":2}');
    });

    test('should change the mode when requested', (){
      themeService.dark();
      expect(themeService.isDark, true);

      themeService.light();
      expect(themeService.isLight, true);

      themeService.system();
      expect(themeService.isSystem, true);
    });

    test('should change the index when requested', (){
      themeService.index = 1;
      expect(themeService.index, 1);

      // clamps invalid index
      themeService.index = -1;
      expect(themeService.index, 0);

      themeService.index = 10;
      expect(themeService.index, 2); // 2 for ThemeServiceTestClass.themes.length = 3
    });
  });

  group('ThemeProvider', (){

    testWidgets('Widget Should initiat with light brightness', (WidgetTester tester) async {
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
      expect(find.text('Mode: ${ThemeMode.dark}'), findsOneWidget);

      // Act 2
      // toogle to light
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.light}'), findsOneWidget);
    });

    testWidgets('blend of next, prev and mode methods', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act 1
      // from default 0 to 1
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.system}'), findsOneWidget);
      expect(find.text('Index: 1'), findsOneWidget);

      // Act 2
      // 1 to 2
      await tester.tap(find.byKey(nextModeButtonKey));
      // system to dark as default mode is system and system brightness is light
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kDarkBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.dark}'), findsOneWidget);
      expect(find.text('Index: 2'), findsOneWidget);

      // Act 3
      // 2 to 0 because test has 3 themes.
      await tester.tap(find.byKey(nextModeButtonKey));
      // dark to light
      await tester.tap(find.byKey(toggleThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(kLightBrightnessString), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.light}'), findsOneWidget);
      expect(find.text('Index: 0'), findsOneWidget);

      // Act 4 - previous
      // 0 to 2 because test has 3 themes.
      await tester.tap(find.byKey(prevModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Mode: ${ThemeMode.light}'), findsOneWidget);
      expect(find.text('Index: 2'), findsOneWidget);
    });
  });
}

String get kLightBrightnessString => 'Brightness: ${Brightness.light}';
String get kDarkBrightnessString => 'Brightness: ${Brightness.dark}';