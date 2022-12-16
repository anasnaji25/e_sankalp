import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: SvgPicture.asset("assets/icons/arrowback.svg")),
                SizedBox(width: 15,),
                Text("Notifications",
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
                //style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group -1.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 182, 181, 181),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group -2.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 182, 181, 181),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group 1.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 182, 181, 181),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group -1.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 182, 181, 181),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group -2.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 182, 181, 181),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/Mask Group 1.png")),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everyday English-French-Spanish:",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("Conversation and Fun - Joe!",
                        style: TextStyle(color: blackGreyColor,fontSize: 16),
                        ),
                        Text("9 hrs",
                        style: TextStyle(color: lightGreyColor,fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}