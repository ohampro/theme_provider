library x_theme_provider;

import 'package:flutter/material.dart';
import 'package:x_theme_provider/src/inherited_theme_provider.dart';
import 'package:x_theme_provider/src/theme_service.dart';

export 'package:x_theme_provider/src/default_material_theme.dart';
export 'package:x_theme_provider/src/default_cupertino_theme.dart';

typedef ThemeProviderBuilder = Widget Function(ThemeMode mode);

class ThemeProvider extends StatefulWidget {
  final ThemeProviderBuilder builder;

  const ThemeProvider({
    super.key,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _ThemeProviderState();

  static ThemeService of(BuildContext context) {
    InheritedThemeProvider.of(context); // propagate build to widget tree
    return context.findAncestorStateOfType<State<ThemeProvider>>()!
        as ThemeService;
  }
}

class _ThemeProviderState extends State<ThemeProvider>
    with ThemeService, WidgetsBindingObserver {
  @override
  void initState() {
    changeNotifier.addListener(_updateState);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final app = widget.builder(mode);

    return InheritedThemeProvider(
      mode = mode,
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
