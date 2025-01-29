import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_app_themes.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _prefsKey = 'isDarkTheme';
  bool _isDark = false;

  bool get isDarkMode => _isDark;
  ThemeData get themeData =>
      _isDark ? ChatAppThemes.darkTheme : ChatAppThemes.lightTheme;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool(_prefsKey) ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, _isDark);
  }
}
