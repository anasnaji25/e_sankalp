import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Container(
                  height: 150,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                              height: 130,
                              width: 100,
                              image: AssetImage("assets/images/temple.png")),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sri Kumaran temple",
                                    style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text("Chennai, Tamilnadu, India.",
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      //fontWeight: FontWeight.w500,
                                    )),
                                Text("Special Puja",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      //fontWeight: FontWeight.w500,
                                    )),
                                Text("Evening: 05 to 06",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text("₹ 61:07",
                                    style: GoogleFonts.rowdies(
                                        fontSize: 25, color: primaryColor
                                        //fontWeight: FontWeight.w500,
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                            Text(""),
                            Text("11/11/2022",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  //fontWeight: FontWeight.w500,
                                )),
                            Text("01 Person",
                                style: GoogleFonts.roboto(
                                    fontSize: 14, color: secondaryColor
                                    //fontWeight: FontWeight.w500,
                                    )),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 22,
                                width: 80,
                                child: Center(
                                  child: Text("Booking",
                                      style: GoogleFonts.rowdies(
                                          fontSize: 12, color: Colors.white
                                          //fontWeight: FontWeight.w500,
                                          )),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xff028F19),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: secondaryColor,
                        blurRadius: 2.5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
