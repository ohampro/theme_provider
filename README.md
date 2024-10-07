<!-- ![cross_theme_provider](https://raw.githubusercontent.com/ohampro/theme_provider/main/banner.png) -->

## You're looking for:
- Dark mode support?
- An easy way to manage themes?
- Pre-made themes?
- Customizable theme?

All with minimal coding and seamless integration for both MaterialApp and CupertinoApp.

**Demo**: [Theme Provider](https://ohampro.github.io/theme_provider/).

## Usage

Wrap your `XApp` with `ThemeProvider`:

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: YourMaterialAppTheme(), // Or DefaultMaterialAppTheme
      builder: (theme) => MaterialApp(
        title: title,
        theme: theme,
        home: YourHomePage(),
      ),
    );
  }
}
```

* With ThemeProvider, there's no need to set `darkTheme` or `themeMode` anymore.



## Changing Theme Mode

```dart
ThemeProvider.of(context).dark();

ThemeProvider.of(context).light();

ThemeProvider.of(context).system();

ThemeProvider.of(context).toggle();

ThemeProvider.of(context).next();

ThemeProvider.of(context).previous();

ThemeProvider.of(context).index = themeIndex;
```



## Create Your Themes

```dart
class YourMaterialAppTheme extends MaterialAppTheme {
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

    // other themes...

    // Make a list of your themes
    @override
    List<ThemeData> themeList() => [light, dark, ];
}
```



## CupertinoApp?

Just use `DefaultCupertinoTheme` or define yours.

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: YorCupertinoAppTheme(),
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
  // persist index like pref.setX(key, ThemeProvider.of(context).index)
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

// get current index?
ThemeProvider.of(context).index;

// get current theme name?
// implement `AppTheme.getName` and then:
ThemeProvider.of(context).name;
```

## Liked Cross Theme Provider?

Show some love, support by starring the repository, or you can

<a href="https://buymeacoffee.com/ohampro" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 40px !important;width: 217px !important;" ></a>


## Future
- Persists selected mode.
- Downloadable themes.