import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/routes/app_routes.dart';

import 'Bindings/bindings.dart';
import 'Controllers/theme_controller.dart';
import 'Utils/custom_theme.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          title: 'GetX Themed App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: HomePage(),
          initialBinding: HomeBinding(),
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
