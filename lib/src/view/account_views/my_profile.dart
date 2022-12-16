import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    Container(
                      height: 60,
                      width: size.width,
                      decoration: BoxDecoration(
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 20),
                        child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/arrowback.svg"),
                    SizedBox(width: 10,),
                    Text("My Profile",
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
                     Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
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
                              labelText: 'Name',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: 'Enter Full Name Here',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
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
                              labelText: 'Name',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: 'Enter Full Name Here',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
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
                              labelText: 'Phone number',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: '9876543210',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
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
                              labelText: 'Email',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: 'rajaram@gmail.com',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
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
                              labelText: 'Date of birth',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: '07/06/1998',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
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
                              labelText: 'Time',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: '12:22:00',
                              isDense: true,                      
                              contentPadding: EdgeInsets.all(13),  
                            ),
                          ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 100),
                        child: Container(
                          height: 40,
                          width: size.width,
                          child: Center(
                            child:  Text("Update",
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                    )),
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(2)
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                        child: Container(
                          height: 40,
                          width: size.width,
                          child: Center(
                            child:  Text("Cancel",
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: greyColor
                    )),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffE4E4E4),
                            borderRadius: BorderRadius.circular(2)
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