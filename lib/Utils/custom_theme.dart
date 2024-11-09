import 'package:flutter/material.dart';

MaterialColor customSwatch = MaterialColor(
  0xFFFFFFFF, // Base color
  <int, Color>{
    50: Color(0xFFE0F7FA),
    100: Color(0xFFB2EBF2),
    200: Color(0xFF80DEEA),
    300: Color(0xFF4DD0E1),
    400: Color(0xFF26C6DA),
    500: Color(0xFF00BCD4),
    600: Color(0xFF00ACC1),
    700: Color(0xFF0097A7),
    800: Color(0xFF00838F),
    900: Color(0xFF000000),
  },
);

ThemeData lightTheme = ThemeData(
  primarySwatch: customSwatch,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF9FAFB), // Added background color
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Main body text
    titleLarge: TextStyle(
        color: Colors.blueGrey,
        fontSize: 20,
        fontWeight: FontWeight.bold), // New extra text style
    bodySmall:
        TextStyle(color: Colors.grey, fontSize: 14), // New extra text style
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF1A1A1A), // Background color for dark theme
  appBarTheme: AppBarTheme(color: Colors.transparent),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Main body text
    titleLarge: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 20,
        fontWeight: FontWeight.bold), // New extra text style
    bodySmall: TextStyle(
        color: Colors.grey.shade400, fontSize: 14), // New extra text style
  ),
);
