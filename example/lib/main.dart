import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

final ValueNotifier<bool> appChangeNotifier = ValueNotifier(true);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appChangeNotifier, 
      builder: (_, material, child) => material 
        ? ThemeProvider(
            themes: DefaultMaterialTheme(),
            builder: (theme) => MaterialApp(
                  title: 'Flutter Demo',
                  theme: theme,
                  darkTheme: DefaultMaterialTheme.dark,
                  home: const MyHomePage(title: 'Flutter Demo Home Page'),
                ),
          )
        : ThemeProvider(
            themes: DefaultCupertinoTheme(),
            builder: (theme) => CupertinoApp(
                  theme: theme,
                  home: const MyCupertinoHomePage(title: 'Flutter Demo Home Page'),
                ),
          ),
    );
  }
}


typedef BtnBuilder = Widget Function(VoidCallback? onPressed, IconData icon, String label);

List<Widget> _buildFeatures(BuildContext context, BtnBuilder builder){
  final ThemeService service = ThemeProvider.of(context);

  return [
    builder(service.light, Icons.light_mode, 'light'),
    builder(service.dark, Icons.dark_mode, 'dark'),
    builder(service.system, Icons.settings, 'system'),
    builder(service.toggle, service.isDark ? Icons.toggle_off : Icons.toggle_on, 'toggle'),
    builder(service.previous, Icons.skip_previous, 'previous'),
    builder(service.next, Icons.skip_next, 'next'),
  ];
}

Widget _buildAppSwitchFeature(BuildContext context, BtnBuilder builder){
  return builder(
    () {
      appChangeNotifier.value = !appChangeNotifier.value;
      ThemeProvider.of(context).next();
    }, 
    appChangeNotifier.value ? Icons.apple : Icons.android,
    appChangeNotifier.value ? 'Cupertino' : 'Material',
  );
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
      body: _buildBody(
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            children: _buildFeatures(context, _buildButton),
          ),
          const SizedBox(height: 50,),
          _buildAppSwitchFeature(context, _buildButton),
          const SizedBox(height: 50,),
          Text('${ThemeProvider.of(context).name} Mode'),
        ],
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
      child: _buildBody(
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _buildFeatures(context, _buildButton),
          ),
          const SizedBox(height: 50,),
          _buildAppSwitchFeature(context, _buildButton),
          const SizedBox(height: 50,),
          Text('${ThemeProvider.of(context).name} Mode'),
        ],
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

Widget _buildBody({required List<Widget> children}){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    ),
  );
}