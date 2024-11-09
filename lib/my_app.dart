import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/screens/home_screen.dart';

import 'Controllers/home_controller.dart';
import 'Controllers/theme_controller.dart';
import 'Utils/custom_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(), // Initialize the controller
      builder: (themeController) {
        return GetMaterialApp(
          title: 'GetX Themed App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.theme, // Access theme from controller
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => HomePage(),
              binding: BindingsBuilder(() {
                Get.put(HomeController());
              }),
            ),
          ],
        );
      },
    );
  }
}
