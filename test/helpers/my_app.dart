
import 'package:flutter/material.dart';
import 'package:theme_provider/default_material_theme.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:theme_provider/theme_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider<ThemeData>(
      theme: const DefaultAppTheme(),
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

class ThemeServiceTestClass with ThemeService{}