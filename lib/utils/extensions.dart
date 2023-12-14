import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get deviceSize => MediaQuery.sizeOf(this);
  ThemeData get _theme => Theme.of(this);
  ColorScheme get colors => _theme.colorScheme;
  TextTheme get textTheme => _theme.textTheme;
}
