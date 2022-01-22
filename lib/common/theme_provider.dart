import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = Themes.themeDark;

  void toggleTheme(bool darkMode) {
    themeData = darkMode ? Themes.themeDark : Themes.themeLight;
    notifyListeners();
  }
}

class Themes {
  static final themeDark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade900,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    fontFamily: 'Raleway',
  );

  static final themeLight = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    fontFamily: 'Raleway',
  );
}
