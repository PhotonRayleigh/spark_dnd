import 'package:flutter/material.dart';

ThemeData lightTheme() {
  ThemeData theme = ThemeData(
    colorSchemeSeed: Colors.green,
    brightness: Brightness.light,
  );
  theme.useMaterial3;
  return theme;
}

ThemeData darkTheme() {
  ThemeData theme = ThemeData(
    colorSchemeSeed: Colors.green,
    brightness: Brightness.dark,
  );
  theme.useMaterial3;
  return theme;
}
