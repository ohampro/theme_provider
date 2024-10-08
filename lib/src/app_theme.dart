
/// Helper class for selecting theme based on mode.
abstract class AppTheme<T> {
  /// Make a list of themes
  AppTheme(T light, T dark) : lightTheme = (() => light), darkTheme = (() => dark);

  /// return light theme if available
  final T Function() lightTheme;

  /// return dark theme if available
  final T Function() darkTheme;
}
