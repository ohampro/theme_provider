import 'package:flutter/material.dart';
import 'package:example/cupertino_app.dart';
import 'package:x_theme_provider/theme_provider.dart';


void main() => runApp(const MyMaterialApp());

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: DefaultMaterialAppTheme(),
      builder: (theme) => MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
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
      body: buildBody(context, _buildButton, _buildAppSwitch),   
      floatingActionButton: FloatingActionButton(
        onPressed: ThemeProvider.of(context).toggle,
        tooltip: 'toggle',
        child: const Icon(Icons.contrast),
      ),
    );
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon, String label){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed, 
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }

  Widget _buildAppSwitch(BuildContext context, BtnBuilder btnBuilder){
    return btnBuilder(
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyCupertinoApp()),
      ), 
      Icons.apple, 
      'Cupertino',
    );
  }
}

typedef BtnBuilder = Widget Function(VoidCallback? onPressed, IconData icon, String label);

Widget buildBody(
  BuildContext context, 
  BtnBuilder btnBuilder, 
  Function(BuildContext context, BtnBuilder builder) buildAppSwitch, 
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${ThemeProvider.of(context).mode}', 
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50,),
        Wrap(
          alignment: WrapAlignment.center,
          children: buildFeatures(context, btnBuilder),
        ),
        const SizedBox(height: 50,),
        buildAppSwitch(context, btnBuilder),
      ]
    ),
  );
}

List<Widget> buildFeatures(BuildContext context, BtnBuilder btnBuilder){
  final ThemeService service = ThemeProvider.of(context);

  return [
    btnBuilder(service.light, Icons.light_mode, 'light'),
    btnBuilder(service.dark, Icons.dark_mode, 'dark'),
    btnBuilder(service.system, Icons.settings, 'system'),
    btnBuilder(service.toggle, service.isDark ? Icons.toggle_off : Icons.toggle_on, 'toggle'),
    btnBuilder(service.previous, Icons.skip_previous, 'previous'),
    btnBuilder(service.next, Icons.skip_next, 'next'),
  ];
}