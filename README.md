<!-- ![cross_theme_provider](https://raw.githubusercontent.com/ohampro/theme_provider/main/banner.png) -->

## Why ThemeProvider?
- Seamless integration with MaterialApp and CupertinoApp.
- Effortless multi-theme management.
- Simplifies triggering theme changes.
- Full control with dark, light, system, next, previous, and toggle.
- Ability to persist selected theme.

**Demo**: [Theme Provider](https://ohampro.github.io/theme_provider/).

## Usage

Wrap your `XApp` with `ThemeProvider`:

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: YourMaterialAppTheme(), // Or DefaultMaterialAppTheme
      builder: (theme) => MaterialApp(
        title: title,
        theme: theme,
        home: YourHomePage(),
      ),
    );
  }
}
```

* ThemeProvider handles `darkTheme` and `themeMode` in `MaterialApp`



## Changing Theme

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
class YourMaterialAppTheme extends AppTheme<ThemeData> {
    YourMaterialAppTheme() : super(light, dark);

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
}
```



## CupertinoApp?

Just use `DefaultCupertinoTheme` or define yours.

```dart
class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: YorCupertinoAppTheme(),
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
  // persist state like pref.setX(key, ThemeProvider.of(context).jsonString)
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

// get or set current theme index?
ThemeProvider.of(context).index;

// persistence ability?
ThemeProvider.of(context).jsonString;
ThemeProvider(
  init: jsonString,
  builder: ...
);

// multi-theme?
ThemeProvider(
  themes: YourThemesList,
  builder: ...
);
// and call next or previous to change theme.
```

## Liked Cross Theme Provider?

Show some love, support by starring the repository, or you can

<a href="https://buymeacoffee.com/ohampro" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 40px !important;width: 217px !important;" ></a>


## Future
- Download and install themes!