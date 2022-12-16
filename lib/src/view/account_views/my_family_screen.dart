import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class MyFamilyScreen extends StatefulWidget {
  const MyFamilyScreen({super.key});

  @override
  State<MyFamilyScreen> createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          color: primaryColor
          ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
         body: SafeArea(
          child: Container(
            height: size.height,
                width: size.width,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                     
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 20),
                      child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: SvgPicture.asset("assets/icons/arrowback.svg")),
                  SizedBox(width: 10,),
                  Text("My Family",
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: greyColor
                  )),
                  
                ],
              ),
                    ),
                   ),
                   //body here
                   Column(
                     children: [
                       Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              height: 70,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                         Text("Raja ram",
                        style: GoogleFonts.roboto(
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                         )),
                          Text("Maish",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          //fontWeight: FontWeight.w500,
                         )),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(2)
              ),
            ),
          ),
                     ],
                   ),
          SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: (){
             showMyDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                height: 40,
                width: size.width,
                child: Center(
                  child: Text("+ Add member",
                  style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                         )
                  ),
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
                ]),
          ),
          ),
      ),
      );
  }
  void showMyDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 450,
            width: 400,
           // color: greyColor,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add family member",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                     )),
                     Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextField(
                        cursorColor: greyColor,
                          decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                            color: greyColor, width: 1.5)),
                            border: OutlineInputBorder(
                              borderRadius: 
                              BorderRadius.circular(2)
                            ),
                            hintText: 'Full name',
                            isDense: true,                      
                            contentPadding: EdgeInsets.all(15),  
                          ),
                        ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        cursorColor: greyColor,
                          decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                            color: greyColor, width: 1.5)),
                            border: OutlineInputBorder(
                              borderRadius: 
                              BorderRadius.circular(2)
                            ),
                            hintText: 'Nakshatra type',
                            isDense: true,                      
                            contentPadding: EdgeInsets.all(15),  
                          ),
                        ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        cursorColor: greyColor,
                          decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                            color: greyColor, width: 1.5)),
                            border: OutlineInputBorder(
                              borderRadius: 
                              BorderRadius.circular(2)
                            ),
                            hintText: 'Date of birth',
                            isDense: true,                      
                            contentPadding: EdgeInsets.all(15),  
                          ),
                        ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        cursorColor: greyColor,
                          decoration: InputDecoration(
                             focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                            color: greyColor, width: 1.5)),
                            border: OutlineInputBorder(
                              borderRadius: 
                              BorderRadius.circular(2)
                            ),
                            hintText: 'Mobile Number',
                            isDense: true,                      
                            contentPadding: EdgeInsets.all(15),  
                          ),
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("for notifiying the family member",
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                     // fontWeight: FontWeight.w500,
                     )),
                     Padding(
                       padding: const EdgeInsets.only(top: 40),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 125,
                            child: Center(
                              child: Text("Cancel",
                               style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                       )
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffE4E4E4),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 125,
                            child: Center(
                              child: Text("Add",
                               style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                       ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor,
                            ),
                          ),
                        ],
                       ),
                     ),
            ],
           ),
          ),
         
        );
      },
    );
  }
}