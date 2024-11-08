import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.blueAccent,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Updated property
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Colors.deepPurpleAccent,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Updated property
  ),
);
