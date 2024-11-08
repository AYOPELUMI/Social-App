import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = false;

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    update(); // Notify GetBuilder to rebuild widgets
  }
}
