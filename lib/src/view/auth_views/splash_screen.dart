import 'package:e_sankalp/src/const/auth_helpers.dart';
import 'package:e_sankalp/src/view/auth_views/choose_language_view.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    checkForAuth();
  }

  nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const ChooseLanguageView());
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => HomePageWithNavigation());
  }

  checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString(authToken);
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      nextScreen();
    } else {
      toHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Image.asset(
              "assets/icons/spl_logo.png",
              height: 320,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
