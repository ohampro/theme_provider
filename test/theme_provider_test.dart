import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/my_app.dart';

void main() {
  group('ThemeService', (){
    late ThemeServiceTestClass themeService;

    setUp(() {
      themeService = ThemeServiceTestClass();
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
      await tester.tap(find.byKey(changeThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.dark.toString()), findsOneWidget);

      // Act 2
      // toogle to light
      await tester.tap(find.byKey(changeThemeButtonKey));
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
      expect(find.text('Mode: ${ThemeMode.light.toString()}'), findsOneWidget);

      // Act 2
      // light to dark
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.dark.toString()), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.dark.toString()}'), findsOneWidget);

      // Act 3
      // dark to system
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Mode: ${ThemeMode.system.toString()}'), findsOneWidget);

      // Act 4
      // system to light again
      await tester.tap(find.byKey(nextModeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.light.toString()), findsOneWidget);
      expect(find.text('Mode: ${ThemeMode.light.toString()}'), findsOneWidget);
    });
  });
}