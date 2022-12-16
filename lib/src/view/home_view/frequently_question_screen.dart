import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class FrequentlyQuestionScreen extends StatefulWidget {
  const FrequentlyQuestionScreen({super.key});

  @override
  State<FrequentlyQuestionScreen> createState() => _FrequentlyQuestionScreenState();
}

class _FrequentlyQuestionScreenState extends State<FrequentlyQuestionScreen> {

  bool isvisible = false;
  bool _isvisible = false;
  bool isvisible1 = false;
  bool isvisible2 = false;
  bool isvisible3 = false;
  bool isvisible4 = false;
  bool isvisible5 = false;
  bool isvisible6 = false;
  bool isvisible7 = false;
  bool isvisible8 = false;
  bool isvisible9 = false;
  bool isvisible10 = false;
  bool isvisible11 = false;
  bool isvisible12 = false;
  bool isvisible13 = false;
  bool isvisible14 = false;
  bool isvisible15 = false;
  bool isvisible16 = false;
  bool isvisible17 = false;
  bool isvisible18 = false;


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
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Text("Frequently Asked Questions",
                style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                isvisible=!isvisible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                height: 40,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("E-Sankalp Related Questions:",
                      style: GoogleFonts.roboto(
                        fontSize: 16,)
                      ),
                      isvisible==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 213, 213),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          if(isvisible==true)
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
             // height: 150,
              width: size.width,
              child:Column(
                children: [
                  InkWell(
                    onTap: (){
                       setState(() {
                           _isvisible=!_isvisible;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              _isvisible==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                        borderRadius:_isvisible==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(_isvisible==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                            style: GoogleFonts.roboto(fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible1=!isvisible1;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible1==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible1==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible1==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible2=!isvisible2;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i reset my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible2==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible2==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible2==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                
              ),
            ),
          ),
          //second
           InkWell(
            onTap: (){
              setState(() {
                isvisible3=!isvisible3;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                height: 40,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Temples Related Questions?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,)
                      ),
                      isvisible==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 213, 213),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          if(isvisible3==true)
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
             // height: 150,
              width: size.width,
              child:Column(
                children: [
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible4=!isvisible4;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible4==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                        borderRadius:isvisible4==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible4==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                            style: GoogleFonts.roboto(fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible5=!isvisible5;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible1==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible5==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible5==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible6=!isvisible6;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i reset my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible6==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible6==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible6==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                
              ),
            ),
          ),
          //third
          SizedBox(height: 10,),
           InkWell(
            onTap: (){
              setState(() {
                isvisible7=!isvisible7;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                height: 40,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("App Related Questions?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,)
                      ),
                      isvisible7==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 213, 213),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          if(isvisible7==true)
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
             // height: 150,
              width: size.width,
              child:Column(
                children: [
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible8=!isvisible8;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible8==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                        borderRadius:isvisible8==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible8==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                            style: GoogleFonts.roboto(fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible9=!isvisible9;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible9==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible9==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible9==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible10=!isvisible10;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i reset my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible10==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible10==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible10==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                
              ),
            ),
          ),
          //fourth
          SizedBox(height: 10,),
           InkWell(
            onTap: (){
              setState(() {
                isvisible11=!isvisible11;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                height: 40,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Support Related Questions?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,)
                      ),
                      isvisible11==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 213, 213),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          if(isvisible11==true)
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
             // height: 150,
              width: size.width,
              child:Column(
                children: [
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible12=!isvisible12;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible12==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                        borderRadius:isvisible12==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible12==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                            style: GoogleFonts.roboto(fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible13=!isvisible13;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible13==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible13==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible13==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible14=!isvisible14;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i reset my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible14==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible14==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible14==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                
              ),
            ),
          ),
          //fifth
          SizedBox(height: 10,),
           InkWell(
            onTap: (){
              setState(() {
                isvisible15=!isvisible15;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Container(
                height: 40,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("What are the different temples?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,)
                      ),
                      isvisible15==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 213, 213),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          if(isvisible15==true)
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Container(
             // height: 150,
              width: size.width,
              child:Column(
                children: [
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible16=!isvisible16;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible16==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                        borderRadius:isvisible16==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible16==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                            style: GoogleFonts.roboto(fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible17=!isvisible17;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i update my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible17==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible17==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible17==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                       setState(() {
                           isvisible18=!isvisible18;
                           });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do i reset my E-Sankalp?",
                              style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              isvisible18==false? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 213, 213),
                         borderRadius:isvisible18==false ? BorderRadius.circular(7) : BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                  if(isvisible18==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Container(
                      height: 70,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n" "elit, sed do eiusmod tempor incididunt ut labore et\n" "dolore magna aliqua. Ut enim ad minim veniam,\n" "quis nostrud exercitation ullamco laboris nisi ut\n" "aliquip ex ea commodo consequat.",
                          style: GoogleFonts.roboto(fontSize: 10),
                          ),
                          
                        ],
                      ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 213, 213),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 50,
              width: size.width,
              child: Center(child: 
              Text("Submit your questions",
              style: GoogleFonts.roboto(fontSize: 24,color: Colors.white),
              ),
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}