import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:theme_provider/theme_service.dart';
import 'package:theme_provider/themes.dart';

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

class ThemeServiceTestClass with ThemeService{}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider<ThemeData>(
      themes: const DefaultMaterialAppThemes(),
      builder: (theme, darkTheme){
        return MaterialApp(
          title: 'Material Test',
          theme: theme,
          darkTheme: darkTheme,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const changeThemeButtonKey = ValueKey('changeThemeButtonKey');
const nextModeButtonKey = ValueKey('nextModeButtonKey');

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            key: changeThemeButtonKey, 
            onPressed: ThemeProvider.of(context).toggle, 
            child: const Text('Change Theme'),
          ),
          Text(Theme.of(context).brightness.toString()),

          ElevatedButton(
            key: nextModeButtonKey, 
            onPressed: ThemeProvider.of(context).next, 
            child: const Text('Next Mode'),
          ),
          Text('Mode: ${ThemeProvider.of(context).mode.toString()}'),
        ],
      ),
    );
  }
}