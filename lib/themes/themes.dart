import 'package:flutter/material.dart';
import 'package:translator_app/utils/app_colors.dart';

class ThemesData {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        onSurface: Colors.black,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.blueGrey.shade100,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 51, 102, 100),
      ));
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        onSurface: Colors.white,
        surface: Colors.grey.shade900,
      ),
      scaffoldBackgroundColor: Colors.grey.shade900,
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromRGBO(0, 51, 102, 100)));
}
