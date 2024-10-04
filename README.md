<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->
<!-- ![cross_theme_provider](https://raw.githubusercontent.com/ohampro/theme_provider/main/banner.png) -->

# Intuitive Theme Provider

Support for **light** and **dark** theme in your Flutter app and define your custom themes.

Demo: [Theme Provider](https://ohampro.github.io/theme_provider/).

## Usage

Wrap your `XApp` with `ThemeProvider`:

```dart
import 'package:theme_provider/theme_provider.dart';

class YourApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (mode) => MaterialApp(
        title: 'Demo App',
        theme: DefaultMaterialTheme.of(mode),
        darkTheme: DefaultMaterialTheme.dark,
        home: YourHomePage(),
      ),
    );
  }
}
```



## Changing Theme Mode

```dart
ThemeProvider.of(context).dark();

ThemeProvider.of(context).light();

ThemeProvider.of(context).system();

ThemeProvider.of(context).toggle();

ThemeProvider.of(context).next();

ThemeProvider.of(context).previous();

ThemeProvider.of(context).mode = ThemeData.dark;
```



## Create Your Themes

```dart
class YourMaterialTheme {

    final static ThemeData light = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.purple,
    );

    final static ThemeData dark = ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.purple,
    );

    // MAKE SURE TO ADD THIS
    static ThemeData of(ThemeMode mode) => AppTheme.of(mode, light, dark);
}
```



## CupertinoTheme?

Just use `DefaultCupertinoTheme` or define yours.

```dart
import 'package:theme_provider/theme_provider.dart';

class YourApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (mode) => CupertinoApp(
        title: 'Demo App',
        theme: DefaultCupertinoTheme.of(mode),
        home: YourHomePage(),
      ),
    );
  }
}
```



## Listen to the mode changes

```dart
ThemeProvider.of(context).changeNotifier.addListener(() {
  // do your thing, or
  // persist mode like pref.setX(key, ThemeProvider.of(context).mode)
});
```

Or react on UI:

```dart
ValueListenableBuilder(
  valueListenable: ThemeProvider.of(context).changeNotifier,
  builder: (_, mode, child) {
    // update your UI
  },
);
```



## More?

```Dart
// get current theme?
Theme.of(context);

// get current mode?
ThemeProvider.of(context).mode;
```

## Liked Cross Theme Provider?

Show some love, support by starring the repository, or you can

<a href="https://buymeacoffee.com/ohampro" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>


## Future
- Persists selected mode.