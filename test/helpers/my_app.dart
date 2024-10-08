
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ThemeProvider(
      theme: DefaultMaterialAppTheme(),
      themes: [DefaultMaterialAppTheme(), DefaultMaterialAppTheme(), DefaultMaterialAppTheme()],
      init: '{"mode":0,"index":0}',
      builder: (theme){
        return MaterialApp(
          title: 'Material Test',
          theme: theme,
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

const toggleThemeButtonKey = ValueKey('changeThemeButtonKey');
const nextModeButtonKey = ValueKey('nextModeButtonKey');
const prevModeButtonKey = ValueKey('prevModeButtonKey');
const systemModeButtonKey = ValueKey('systemModeButtonKey');

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            key: toggleThemeButtonKey, 
            onPressed: ThemeProvider.of(context).toggle, 
            child: const Text('Change Theme'),
          ),
          Text('Brightness: ${Theme.of(context).brightness}'),

          ElevatedButton(
            key: prevModeButtonKey, 
            onPressed: ThemeProvider.of(context).previous, 
            child: const Text('Prev. Mode'),
          ),
          ElevatedButton(
            key: nextModeButtonKey, 
            onPressed: ThemeProvider.of(context).next, 
            child: const Text('Next Mode'),
          ),
          Text('Mode: ${ThemeProvider.of(context).mode}'),

          Text('Index: ${ThemeProvider.of(context).index}'),

          ElevatedButton(
            key: systemModeButtonKey, 
            onPressed: ThemeProvider.of(context).system, 
            child: const Text('System Mode'),
          ),
        ],
      ),
    );
  }
}

class ThemeServiceTestClass with ThemeService{  
  @override
  AppTheme? get fixedTheme => DefaultMaterialAppTheme();
  
  @override
  List<AppTheme>? get themes => [DefaultMaterialAppTheme(), DefaultMaterialAppTheme(), DefaultMaterialAppTheme()];
}