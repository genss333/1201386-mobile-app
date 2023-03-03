import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Atomed',
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6200EE),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 1.5,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Atomed',
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'Atomed',
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF6200EE),
    unselectedItemColor: Colors.black,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Atomed',
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBB86FC),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    toolbarTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Atomed',
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Atomed',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white12,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    selectedItemColor: Color(0xFFBB86FC),
    unselectedItemColor: Colors.white,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData getThemeFromKey(String key) {
  switch (key) {
    case 'light':
      return lightTheme;
    case 'dark':
      return darkTheme;
    default:
      return lightTheme;
  }
}
