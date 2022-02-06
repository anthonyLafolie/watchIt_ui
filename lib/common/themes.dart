import 'package:flutter/material.dart';

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
    snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.red),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.purple),
    ),
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
    snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.red),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.black),
      trackColor: MaterialStateProperty.all(Colors.grey),
    ),
  );
}
