import 'package:flutter/material.dart';
import 'package:example/src/cupertino_app.dart';
import 'package:x_theme_provider/theme_provider.dart';
import 'package:example/src/my_material_themes.dart';


void main() => runApp(const MyMaterialApp());

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: themes,
      builder: (theme) => MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: const MyHomePage(title: 'Flutter Material Demo'),
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
        title: Text('${widget.title} - ${ThemeProvider.of(context).mode}'),
      ),
      body: buildBody(context, _buildButton, _buildAppSwitch, themes),   
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
  List<AppTheme> themes
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40.0),
    child: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
                  alignment: WrapAlignment.center,
                  children: buildFeatures(context, btnBuilder),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildAppSwitch(context, btnBuilder),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildThemes(context, btnBuilder, themes),
            ),
          ],
        ),
      ),
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
  ];
}

List<Widget> buildThemes(BuildContext context, BtnBuilder btnBuilder, List<AppTheme> themes){
  final ThemeService service = ThemeProvider.of(context);

  return [
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        btnBuilder(service.previous, Icons.skip_previous, 'previous'),
        btnBuilder(service.next, Icons.skip_next, 'next'),  
      ],
    ),
    const SizedBox(height: 50,),
    Column(
      children: themes.map((theme) => btnBuilder(
      () => ThemeProvider.of(context).index = themes.indexOf(theme),
      (themes.indexOf(theme) == ThemeProvider.of(context).index)
        ? Icons.keyboard_double_arrow_right
        : Icons.keyboard_arrow_right_outlined,
      'Theme ${themes.indexOf(theme)} - ${theme.name}',
    )).toList(),
    ),
  ];
}