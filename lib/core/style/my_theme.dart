import 'package:flutter/material.dart';

class MyThemeData {
  static const Color yellowColor = Color(0xFFFFBB3B);
  static const Color Black = Color(0xFF121312);
  static const Color oBlack = Color(0xFF1a1a1a);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: oBlack,
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: oBlack,
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
