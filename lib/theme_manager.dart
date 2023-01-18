/// Theme Manager to manage the app's current theme
import 'package:flutter/material.dart';

enum Themes {
  light,
  dark,
}

class ThemeManager {
  static Themes _currentTheme = Themes.light;
  static const Color _bgColLight = Colors.white;
  static final Color _bgColDark = Colors.blueGrey.shade900;
  static const Color _textColLight = Colors.black;
  static const Color _textColDark = Colors.white;
  static const Color _buttonTextColorLight = Colors.white;
  static const Color _buttonTextColorDark = Colors.black;

  static Color bgColor() {
    switch (_currentTheme) {
      case Themes.light:
        return _bgColLight;
      case Themes.dark:
        return _bgColDark;
    }
  }

  static Color textColor() {
    switch (_currentTheme) {
      case Themes.light:
        return _textColLight;
      case Themes.dark:
        return _textColDark;
    }
  }

  static Color buttonTextColor() {
    switch (_currentTheme) {
      case Themes.light:
        return _buttonTextColorLight;
      case Themes.dark:
        return _buttonTextColorDark;
    }
  }

  static void setTheme(Themes theme) {
    switch (theme) {
      case Themes.light:
        _currentTheme = Themes.light;
        break;
      case Themes.dark:
        _currentTheme = Themes.dark;
        break;
    }
  }

  static Themes getTheme() {
    return _currentTheme;
  }
}
