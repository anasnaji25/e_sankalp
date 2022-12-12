import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => HomePageWithNavigation());
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
          child: Image.asset("assets/icons/logo.png"),
        ),
      ),
    );
  }
}
