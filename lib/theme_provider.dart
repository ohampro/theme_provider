library x_theme_provider;

import 'package:flutter/material.dart';
import 'package:x_theme_provider/src/app_theme.dart';
import 'package:x_theme_provider/src/inherited_theme_provider.dart';
import 'package:x_theme_provider/src/theme_service.dart';

export 'package:x_theme_provider/src/app_theme.dart';
export 'package:x_theme_provider/src/default_material_app_theme.dart';
export 'package:x_theme_provider/src/default_cupertino_app_theme.dart';
export 'package:x_theme_provider/src/theme_service.dart';

/// Builds widget based on mode.
typedef ThemeProviderBuilder<T> = Widget Function(T theme);

/// This widget provides theme mode by its builder and manages system theme changes.
class ThemeProvider<T> extends StatefulWidget {
  /// size of themes
  final AppTheme<T> themes;

  /// Build a widget based on mode argument. (most probably a MaterialApp or CupertinoApp)
  final ThemeProviderBuilder<T> builder;

  // ignore: public_member_api_docs
  const ThemeProvider({
    super.key,
    required this.themes,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _ThemeProviderState<T>();

  /// Allow access to theme services like toggle, ligh, dark etc.
  static ThemeService of(BuildContext context) {
    InheritedThemeProvider.of(context); // propagate build to widget tree
    return context.findAncestorStateOfType<State<ThemeProvider>>()!
        as ThemeService;
  }
}

class _ThemeProviderState<T> extends State<ThemeProvider<T>>
    with ThemeService, WidgetsBindingObserver {
  /// list of available themes.
  @override
  AppTheme<T> get appTheme => widget.themes;

  @override
  void initState() {
    changeNotifier.addListener(_updateState);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final app = widget.builder(theme());

    return InheritedThemeProvider(
      index: index,
      child: app,
    );
  }

  @override
  void dispose() {
    changeNotifier.removeListener(_updateState);
    changeNotifier.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _updateState() {
    if (mounted) setState(() {});
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (isSystem) {
      _updateState();
    }
  }
}
