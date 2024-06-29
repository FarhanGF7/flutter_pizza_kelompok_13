import 'package:flutter/material.dart';
import 'package:uts_app/themes/light_mode.dart';
import 'package:uts_app/themes/dark_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkTheme => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData == themeData ? _themeData = lightTheme : _themeData = darkTheme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }
}
