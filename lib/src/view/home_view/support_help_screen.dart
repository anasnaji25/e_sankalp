import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/models/support_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class SupportAndHelp extends StatefulWidget {
  const SupportAndHelp({super.key});

  @override
  State<SupportAndHelp> createState() => _SupportAndHelpState();
}

class _SupportAndHelpState extends State<SupportAndHelp> {
  final profileController = Get.find<ProfileController>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: primaryColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Support and Help",
                            style: GoogleFonts.roboto(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: greyColor)),
                        SvgPicture.asset("assets/icons/notification.svg"),
                      ],
                    ),
                  ),
                ),
                //body here
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SvgPicture.asset("assets/images/img.svg"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image(
                            height: 100,
                            image: AssetImage("assets/images/Group 1445.png")),
                        Text("Call",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                color: lightGreyColor)),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Image(
                            height: 100,
                            image: AssetImage("assets/images/Group 1446.png")),
                        Text("Email",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                // fontWeight: FontWeight.w500,
                                color: lightGreyColor)),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: TextField(
                    cursorColor: greyColor,
                    controller: nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: greyColor),
                      hintText: 'Enter Full Name Here',
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: TextField(
                    cursorColor: greyColor,
                    controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: greyColor),
                      hintText: 'Enter Email Address',
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: TextField(
                    // maxLength: 500,
                    maxLines: 2,
                    cursorColor: greyColor,
                    controller: messageController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      labelText: 'Message',
                      labelStyle: TextStyle(color: greyColor),
                      hintText: 'Enter Message',
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, right: 65, top: 30),
                  child: InkWell(
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          messageController.text.isNotEmpty) {
                        SupportModel supportModel = SupportModel(
                            email: emailController.text,
                            message: messageController.text,
                            name: nameController.text);

                        profileController.askSupport(supportModel);

                        emailController.clear();
                        nameController.clear();
                        messageController.clear();
                      } else {
                        Get.snackbar(
                          "Fill all the fields",
                          "",
                          icon: const Icon(Icons.error_outline,
                              color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          borderRadius: 20,
                          margin: const EdgeInsets.all(15),
                          colorText: Colors.white,
                          duration: const Duration(seconds: 3),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Send",
                                style: GoogleFonts.roboto(
                                    fontSize: 23,
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
