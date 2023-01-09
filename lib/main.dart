import 'package:e_sankalp/l10n/locale_languages.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/controllers/donation_amount_controller.dart';
import 'package:e_sankalp/src/controllers/language_controller.dart';
import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:e_sankalp/src/view/auth_views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
   await GetStorage.init();
  Get.put(AuthController());
  Get.put(TempleController());
  Get.put(ProfileController());
  Get.put(DonationController());
  Get.put(LanguageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final storage = GetStorage();
    return GetMaterialApp(
      title: 'E Sankalp',
      translations: Messages(),
      locale: storage.read('langCode') != null
          ? Locale(storage.read('langCode'), storage.read('countryCode'))
          : const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const SplashScreens(),
    );
  }
}
