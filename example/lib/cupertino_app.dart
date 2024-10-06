import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: DefaultCupertinoTheme(),
      builder: (theme) => CupertinoApp(
            theme: theme,
            home: const MyCupertinoHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}

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
      child: buildBody(context, _buildButton, _buildAppSwitch),
    );
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon, String label){
    return SizedBox(
      width: 150,
      child: CupertinoButton(
        onPressed: onPressed, 
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
            Text(label),
          ],
        ), 
      ),
    );
  }

  Widget _buildAppSwitch(BuildContext context, BtnBuilder builder){    
    return builder(() => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyMaterialApp()),
    ), Icons.android, 'Material');
  }
}
