<!-- ![cross_theme_provider](https://raw.githubusercontent.com/ohampro/theme_provider/main/banner.png) -->

# Intuitive Theme Provider

Support for **light** and **dark** theme in your Flutter app and define your custom themes.

Demo: [Theme Provider](https://ohampro.github.io/theme_provider/).

## Usage

Wrap your `XApp` with `ThemeProvider`:

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: DefaultMaterialTheme(),
      builder: (theme) => MaterialApp(
        title: title,
        theme: theme,
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

ThemeProvider.of(context).mode = ThemeService.darkMode;
```



## Create Your Themes

```dart
class YourMaterialTheme extends AppTheme<ThemeData> {
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

    // Make a list of your themes
    @override
    List<ThemeData> themeList() => super.from(light, dark, rest: [other themes]);
}
```



## CupertinoApp?

Just use `DefaultCupertinoTheme` or define yours.

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: DefaultCupertinoTheme(),
      builder: (theme) => CupertinoApp(
        title: title,
        theme: theme,
        home: YourHomePage(),
      ),
    );
  }
}
```



## Listen to the changes

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
  ...
);
```



## More?

```Dart
// get current theme?
Theme.of(context);

// get current mode?
ThemeProvider.of(context).mode;

// get current mode name?
ThemeProvider.of(context).name;

// get name of a mode:
YourAppTheme.nameOf(mode); // e.g. DefaultCupertinoTheme().nameOf(mode)
```

## Liked Cross Theme Provider?

Show some love, support by starring the repository, or you can

<a href="https://buymeacoffee.com/ohampro" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 40px !important;width: 217px !important;" ></a>


## Future
- Persists selected mode.