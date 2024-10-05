import 'package:flutter/widgets.dart';

/// Provides current mode to its children.
/// This is an internal widget and should not be used directly.
class InheritedThemeProvider extends InheritedWidget {
  /// current mode
  final int mode;

  // ignore: public_member_api_docs
  const InheritedThemeProvider(this.mode, {super.key, required super.child});

  /// Allows access to current mode.
  static InheritedThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedThemeProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedThemeProvider oldWidget) {
    return mode != oldWidget.mode;
  }
}
