
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';
import 'package:x_theme_provider/src/theme_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (mode){
        return MaterialApp(
          title: 'Material Test',
          theme: DefaultMaterialTheme.of(mode),
          darkTheme: DefaultMaterialTheme.dark,
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