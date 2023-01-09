import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final languageController = GetStorage();

  var myLocal = [];
  var us = const Locale('en', 'US');
  void saveLocale(Locale lang) {
    Get.updateLocale(lang);
    languageController.write('langCode', lang.languageCode);
    languageController.write('countryCode', lang.countryCode);
  }
}
