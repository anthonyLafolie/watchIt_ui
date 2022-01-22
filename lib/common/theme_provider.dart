import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = Themes.themeLight;

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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.purple),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      showSelectedLabels: true,
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
      selectedIconTheme: IconThemeData(color: Colors.purple),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      showSelectedLabels: true,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    fontFamily: 'Raleway',
  );
}
