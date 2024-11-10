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
    800: Color(0x0000000D),
    900: Color(0xFF000000),
  },
);

ThemeData lightTheme = ThemeData(
  primarySwatch: customSwatch,
  brightness: Brightness.light,
  scaffoldBackgroundColor:
      Color(0xFFF9FAFB), // Background color for light theme
  primaryColor: Color(0xFFFFFFFF),
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF292D32), // Icon color for light theme
    size: 24, // Optional: adjust the size of the icons
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Main body text
    titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold), // New extra text style
    bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400), // New extra text style
    bodyMedium: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF1A1A1A),
  primaryColor: Colors.white,
  // Background color for dark theme
  appBarTheme: AppBarTheme(color: Colors.transparent),
  iconTheme: IconThemeData(
    color: Color(0xFF292D32), // Icon color for dark theme (adjust if needed)
    size: 24, // Optional: adjust the size of the icons
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600), // Main body text
    titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold), // New extra text style
    bodySmall: TextStyle(
        color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400), // New extra text style
  ),

  searchBarTheme: SearchBarThemeData(
    backgroundColor: MaterialStateProperty.all(customSwatch.shade800),
  ),

  // You can add this to fix the issue in your 'MaterialStateProperty'
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(
          Colors.white), // Replace with your desired color
    ),
  ),
);
