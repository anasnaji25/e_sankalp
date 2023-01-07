import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  final templeController = Get.find<TempleController>();

  @override
  void initState() {
    super.initState();
    templeController.getMyBookingsList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 5,
        elevation: 0,
        title: Text("Support and Help",
            style: GoogleFonts.roboto(
                fontSize: 25, fontWeight: FontWeight.w500, color: greyColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ],
      ),
      body: GetBuilder<TempleController>(builder: (context) {
        return ListView.builder(
          itemCount: templeController.bookingList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Container(
                height: 150,
                width: size.width,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        templeController.bookingList[index].temples.image1 ==
                                null
                            ? Image(
                                height: 130,
                                width: 100,
                                image: AssetImage("assets/images/temple.png"))
                            : Image(
                                height: 130,
                                width: 100,
                                fit: BoxFit.cover,
                                image: NetworkImage(templeController
                                    .bookingList[index].temples.image1)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                    templeController
                                        .bookingList[index].temples.templeName,
                                    style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              Text(
                                  templeController
                                          .bookingList[index].temples.address ??
                                      "",
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    //fontWeight: FontWeight.w500,
                                  )),
                              Text("",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    //fontWeight: FontWeight.w500,
                                  )),
                              Text(templeController.bookingList[index].session,
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(
                                  "₹${templeController.bookingList[index].totalAmount}",
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
                          Text(
                              formatDate(
                                  templeController.bookingList[index].poojaDate,
                                  [dd, "-", mm, "-", yyyy]),
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                //fontWeight: FontWeight.w500,
                              )),
                          // Text("${templeController.bookingList[index].} Person",
                          //     style: GoogleFonts.roboto(
                          //         fontSize: 14, color: secondaryColor
                          //         //fontWeight: FontWeight.w500,
                          //         )),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, top: 5),
                            child: Container(
                              height: 22,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xff028F19),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Booked",
                                    style: GoogleFonts.rowdies(
                                        fontSize: 12, color: Colors.white
                                        //fontWeight: FontWeight.w500,
                                        )),
                              ),
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
      }),
    );
  }
}
