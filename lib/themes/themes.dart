import 'package:flutter/material.dart';
import 'package:tinderjob/constants/style/style_constants.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: StyleConstants.scaffoldBackgroundColor,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: StyleConstants.primary,
    secondary: StyleConstants.secondary,
    background: Color.fromARGB(255, 4, 214, 99),
    surface: Colors.amber,
    error: Colors.red,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: StyleConstants.primary,
  scaffoldBackgroundColor: StyleConstants.scaffoldBackgroundColor,
);
