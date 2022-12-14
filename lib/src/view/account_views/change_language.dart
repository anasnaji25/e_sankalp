import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/view/auth_views/login_screen_view.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:e_sankalp/src/widgets/choose_language_widgets/bhakthi_model_languagecontainer.dart';
import 'package:e_sankalp/src/widgets/choose_language_widgets/language_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Obx(
              () => Container(
                height: 500,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "Choose Languages",
                      style: primaryFont.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(0);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: LanguageContainer(
                        isSelected: authController.langIndex.value == 0,
                        languageName: "English",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(1);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: BhakthiModelLanguageContainer(
                        isSelected: authController.langIndex.value == 1,
                        languageName: "bakthi model",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(2);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: LanguageContainer(
                        isSelected: authController.langIndex.value == 2,
                        languageName: "Tamil",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(3);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: LanguageContainer(
                        isSelected: authController.langIndex.value == 3,
                        languageName: "Hindi",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(4);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: LanguageContainer(
                        isSelected: authController.langIndex.value == 4,
                        languageName: "Telugu",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        authController.langIndex(5);
                        // await Future.delayed(const Duration(seconds: 1));
                        // Get.to(() => LoginView());
                      },
                      child: LanguageContainer(
                        isSelected: authController.langIndex.value == 5,
                        languageName: "Malayalam",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
