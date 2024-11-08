import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/home.dart';

import 'Controllers/theme_controller.dart';
import 'Utils/custom_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(), // Initialize the controller
      builder: (themeController) {
        return MaterialApp(
          title: 'GetX Themed App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.theme, // Access theme from controller
          home: HomePage(),
        );
      },
    );
  }
}
