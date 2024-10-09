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
  /// fixed theme when you have just one theme. for multiple themes use `themes` property.
  final AppTheme<T>? theme;

  /// list of themes used for `next` and `prev` methods.
  /// this property will be ignored if you set `theme`, just one of these is expected.
  final List<AppTheme<T>>? themes;

  /// initial state in format a,b where a is ThemeMode and b is theme index.
  /// for example 0,0 means system mode and theme index 0.
  final String? init;

  /// Build a widget based on mode argument. (most probably a MaterialApp or CupertinoApp)
  final ThemeProviderBuilder<T> builder;

  // ignore: public_member_api_docs
  const ThemeProvider({
    super.key,
    this.theme,
    this.themes,
    this.init,
    required this.builder,
  }) : assert(theme != null || themes != null,
            'Either theme or themes must be provided');

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
  /// fixed theme.
  @override
  AppTheme<T>? get fixedTheme => widget.theme;

  /// list of available themes.
  @override
  List<AppTheme<T>>? get themes => widget.themes;

  @override
  void initState() {
    if (widget.init != null) {
      fromJsonString(widget.init!);
    }

    changeNotifier.addListener(_updateState);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final app = widget.builder(theme());

    return InheritedThemeProvider(
      mode: mode,
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
