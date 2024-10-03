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

    testWidgets('Toggle mode should show dark mode', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      // toogle to dark
      await tester.tap(find.byKey(changeThemeButtonKey));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(Brightness.dark.toString()), findsOneWidget);
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(Theme.of(context).brightness.toString()),
          ElevatedButton(
            key: changeThemeButtonKey, 
            onPressed: ThemeProvider.of(context).toggle, 
            child: const Text('Change Theme'),
          )
        ],
      ),
    );
  }
}