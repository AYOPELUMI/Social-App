import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/my_app.dart';

import 'Controllers/theme_controller.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}
