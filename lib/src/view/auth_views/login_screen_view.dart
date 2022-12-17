import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/view/auth_views/choose_language_view.dart';
import 'package:e_sankalp/src/view/auth_views/otp_validation_view.dart';
import 'package:e_sankalp/src/view/auth_views/sign_up_screen_view.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgoud_img (2).jpeg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/icons/logo.png",
                  height: 180,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login",
                          style: primaryFont.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 40),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Mobile or Email ID",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                        BorderSide(color: primaryColor))),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => OtpVerificationView());
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: secondaryColor),
                              alignment: Alignment.center,
                              child: Text(
                                "Continues",
                                style: primaryFont.copyWith(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Colors.black45.withOpacity(0.6),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  "Or",
                                  style: primaryFont.copyWith(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Colors.black45.withOpacity(0.6),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> SignUpView());
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: primaryFont.copyWith(
                                      color: Colors.black45, fontSize: 16),
                                  children: [
                                TextSpan(
                                    text: "Signup",
                                    style: primaryFont.copyWith(
                                        color: primaryColor, fontSize: 16)),
                              ])),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
