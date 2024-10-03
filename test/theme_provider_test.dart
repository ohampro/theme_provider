import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:theme_provider/theme_service.dart';
import 'package:theme_provider/themes.dart';

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

  group('ThemeProvider', (){

    testWidgets('Widget Should be intuitive and easy to use', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ThemeProvider<ThemeData>(
          themes: const DefaultMaterialAppThemes(), 
          builder: (context, theme, darkTheme){
            return MaterialApp(
              title: 'Material Test',
              theme: theme,
              darkTheme: darkTheme,
              home: Scaffold(
                body: Text(Theme.of(context).brightness.toString()),
              ),
            );
          },
      ));

      expect(find.text(Brightness.light.toString()), findsOneWidget);
    });
  });
}