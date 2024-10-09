import 'package:example/main.dart' show buildBody, BtnBuilder, MyMaterialApp;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_theme_provider/theme_provider.dart';
import 'package:example/src/my_cupertino_themes.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: themes,
      builder: (theme) => CupertinoApp(
            theme: theme,
            home: const MyCupertinoHomePage(title: 'Cupertino Cupertino Demo'),
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
        middle: Text('${widget.title} - ${ThemeProvider.of(context).mode}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: buildBody(context, _buildButton, _buildAppSwitch, themes),
    );
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon, String label){
    return SizedBox(
      child: CupertinoButton(
        onPressed: onPressed, 
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
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
