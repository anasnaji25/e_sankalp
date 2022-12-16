import 'package:e_sankalp/src/view/account_views/change_language.dart';
import 'package:e_sankalp/src/view/account_views/my_family_screen.dart';
import 'package:e_sankalp/src/view/account_views/my_profile.dart';
import 'package:e_sankalp/src/view/auth_views/choose_language_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 36,
            width: size.width,
            color: primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Row(
              children: [
                Text("My Account",
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyProfileScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 15),
              child: Container(
                height: 50,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("My Profile",
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000029),
                      blurRadius: 5.5,
                    )
                  ],
                  border: Border.all(color: primaryColor),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyFamilyScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 15),
              child: Container(
                height: 50,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("My Family",
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000029),
                      blurRadius: 5.5,
                    )
                  ],
                  border: Border.all(color: primaryColor),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: InkWell(
              onTap: () {
                Get.to(() => ChangeLanguageView());
              },
              child: Container(
                height: 50,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.sign_language_outlined,
                            color: primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Languages",
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000029),
                      blurRadius: 5.5,
                    )
                  ],
                  border: Border.all(color: primaryColor),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
            child: Container(
              height: 50,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: primaryColor,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Logout",
                            style: GoogleFonts.roboto(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff00000029),
                    blurRadius: 5.5,
                  )
                ],
                border: Border.all(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
