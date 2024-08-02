import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/themes/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeDataStyle = ThemesData.lightTheme;

  ThemeData get themeDataStyle => _themeDataStyle;

  set themeDataStyle(ThemeData dataTheme) {
    _themeDataStyle = dataTheme;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeDataStyle == ThemesData.lightTheme) {
      themeDataStyle = ThemesData.darkTheme;
    } else {
      themeDataStyle = ThemesData.lightTheme;
    }
  }
}
