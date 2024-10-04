import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

bool material = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (mode){
          return material ? 
          MaterialApp(
            title: 'Flutter Demo',
            theme: DefaultMaterialTheme.of(mode),
            darkTheme: DefaultMaterialTheme.dark,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ) : 
          CupertinoApp(
            theme: DefaultCupertinoTheme.of(mode),
            home: const MyCupertinoHomePage(title: 'Flutter Demo Home Page'),
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
            ElevatedButton.icon(
              onPressed: () {
                material = !material;
                ThemeProvider.of(context).next();
              }, 
              icon: Icon(material ? Icons.apple : Icons.android), 
              label: Text(material ? 'Cupertino' : 'Material'),
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).light, 
                    child: const Row(
                      children: [
                        Icon(Icons.light_mode),
                        Text('light'),
                      ],
                    ), 
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).dark, 
                    child: const Row(
                      children: [
                        Icon(Icons.dark_mode),
                        Text('dark'),
                      ],
                    ), 
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).system, 
                    child: const Row(
                      children: [
                        Icon(Icons.settings), 
                        Text('system'),
                      ],
                    ), 
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).toggle, 
                    child: Row(
                      children: [
                        Icon(ThemeProvider.of(context).isDark ? Icons.toggle_off : Icons.toggle_on), 
                        const Text('toggle'),
                      ],
                    ), 
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).previous, 
                    child: const Row(
                      children: [
                        Icon(Icons.skip_previous), 
                        Text('previous'),
                      ],
                    ), 
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CupertinoButton(
                    onPressed: ThemeProvider.of(context).next, 
                    child: const Row(
                      children: [
                        Icon(Icons.skip_next), 
                        Text('next'),
                      ],
                    ), 
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,),
            SizedBox(
              width: 150,
              child: CupertinoButton(
                onPressed: () {
                  material = !material;
                  ThemeProvider.of(context).previous();
                }, 
                child: Row(
                  children: [
                    Icon(material ? Icons.apple : Icons.android), 
                    Text(material ? 'Cupertino' : 'Material'),
                  ],
                ), 
              ),
            ),
            const SizedBox(height: 50,),
            Text('${ThemeProvider.of(context).mode} Mode'),
          ],
        ),
      ),
    );
  }
}