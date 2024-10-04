import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (mode){
          return MaterialApp(
          title: 'Flutter Demo',
          theme: DefaultMaterialTheme.of(mode),
          darkTheme: DefaultMaterialTheme.dark,
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
            Wrap(
              children: [
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).light, 
                  icon: const Icon(Icons.light_mode),
                  label: const Text('light'),
                ),
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).dark, 
                  icon: const Icon(Icons.dark_mode),
                  label: const Text('dark'),
                ),
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).system, 
                  icon: const Icon(Icons.settings), 
                  label: const Text('system'),
                ),
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).toggle, 
                  icon: Icon(ThemeProvider.of(context).isDark ? Icons.toggle_off : Icons.toggle_on), 
                  label: const Text('toggle'),
                ),
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).previous, 
                  icon: const Icon(Icons.skip_previous), 
                  label: const Text('previous'),
                ),
                ElevatedButton.icon(
                  onPressed: ThemeProvider.of(context).next, 
                  icon: const Icon(Icons.skip_next), 
                  label: const Text('next'),
                ),
              ],
            ),
            const SizedBox(height: 50,),
            Text('${ThemeProvider.of(context).mode} Mode'),
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
}
