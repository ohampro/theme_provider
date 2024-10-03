import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:theme_provider/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider<ThemeData>(
      themes: const DefaultMaterialAppThemes(),
      builder: (theme, darkTheme){
          return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          darkTheme: darkTheme,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
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
            const Text('A text Widget for presenting the theme'),
            Text('${ThemeProvider.of(context).mode} Mode'),
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ThemeProvider.of(context).toggle,
        tooltip: 'toggle',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
