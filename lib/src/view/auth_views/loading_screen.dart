import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/view/auth_views/choose_language_view.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreenView extends StatefulWidget {
  const LoadingScreenView({super.key});

  @override
  State<LoadingScreenView> createState() => _LoadingScreenViewState();
}

class _LoadingScreenViewState extends State<LoadingScreenView> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => HomePageWithNavigation());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/My Video.gif"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(),
      ),
    );
  }
}
