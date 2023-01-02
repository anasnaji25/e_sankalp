import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:e_sankalp/src/view/auth_views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  Get.put(TempleController());
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Sankalp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: SplashScreens(),
    );
  }
}
