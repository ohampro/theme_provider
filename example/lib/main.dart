import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

final ValueNotifier<bool> appChangeNotifier = ValueNotifier(true);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = DefaultMaterialTheme();
    final cupertinoTheme = DefaultCupertinoTheme();

    return ValueListenableBuilder(
      valueListenable: appChangeNotifier, 
      builder: (_, material, child) {
        return material ?
          ThemeProvider(
            themes: materialTheme,
            builder: (theme) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: theme,
                  darkTheme: DefaultMaterialTheme.dark,
                  home: const MyHomePage(title: 'Flutter Demo Home Page'),
                );
              },
          )
        :
          ThemeProvider(
            themes: cupertinoTheme,
            builder: (theme) {
                return CupertinoApp(
                  theme: theme,
                  home: const MyCupertinoHomePage(title: 'Flutter Demo Home Page'),
                );
              },
          );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                _buildButton(ThemeProvider.of(context).light, Icons.light_mode, 'light'),
                _buildButton(ThemeProvider.of(context).dark, Icons.dark_mode, 'dark'),
                _buildButton(ThemeProvider.of(context).system, Icons.settings, 'system'),
                _buildButton(ThemeProvider.of(context).toggle, ThemeProvider.of(context).isDark ? Icons.toggle_off : Icons.toggle_on, 'toggle'),
                _buildButton(ThemeProvider.of(context).previous, Icons.skip_previous, 'previous'),
                _buildButton(ThemeProvider.of(context).next, Icons.skip_next, 'next'),
              ],
            ),
            const SizedBox(height: 50,),
            _buildButton(
              () {
                appChangeNotifier.value = !appChangeNotifier.value;
                ThemeProvider.of(context).next();
              }, 
              appChangeNotifier.value ? Icons.apple : Icons.android,
              appChangeNotifier.value ? 'Cupertino' : 'Material',
            ),
            const SizedBox(height: 50,),
            Text('${ThemeProvider.of(context).name} Mode'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ThemeProvider.of(context).toggle,
        tooltip: 'toggle',
        child: const Icon(Icons.contrast),
      ),
    );
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon, String label){
    return ElevatedButton.icon(
      onPressed: onPressed, 
      icon: Icon(icon),
      label: Text(label),
    );
  }
}


// ------------------------------- Cupertino App

class MyCupertinoHomePage extends StatefulWidget {
  const MyCupertinoHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyCupertinoHomePage> createState() => _MyCupertinoHomePageState();
}

class _MyCupertinoHomePageState extends State<MyCupertinoHomePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Theme'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _buildButton(ThemeProvider.of(context).light, Icons.light_mode, 'light'),
                _buildButton(ThemeProvider.of(context).dark, Icons.dark_mode, 'dark'),
                _buildButton(ThemeProvider.of(context).system, Icons.settings, 'system'),
                _buildButton(ThemeProvider.of(context).toggle, ThemeProvider.of(context).isDark ? Icons.toggle_off : Icons.toggle_on, 'toggle'),
                _buildButton(ThemeProvider.of(context).previous, Icons.skip_previous, 'previous'),
                _buildButton(ThemeProvider.of(context).next, Icons.skip_next, 'next'),
              ],
            ),
            const SizedBox(height: 50,),
            _buildButton(
              () {
                appChangeNotifier.value = !appChangeNotifier.value;
                ThemeProvider.of(context).previous();
              }, 
              appChangeNotifier.value ? Icons.apple : Icons.android, 
              appChangeNotifier.value ? 'Cupertino' : 'Material'
            ),
            const SizedBox(height: 50,),
            Text('${ThemeProvider.of(context).name} Mode'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon, String label){
    return SizedBox(
      width: 150,
      child: CupertinoButton(
        onPressed: onPressed, 
        child: Row(
          children: [
            Icon(icon),
            Text(label),
          ],
        ), 
      ),
    );
  }
}