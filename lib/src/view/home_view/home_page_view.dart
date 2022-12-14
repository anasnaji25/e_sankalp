import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/view/admin_view/admin_view.dart';
import 'package:e_sankalp/src/view/booking_view/booking_view.dart';
import 'package:e_sankalp/src/view/donation_view/donations_view.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:e_sankalp/src/view/temples_view/temples_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    profileController.getAstrologyDetails();
    profileController.getAstrologyChartDetails();
    profileController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        leading: Image.asset("assets/icons/Group 18.png"),
        centerTitle: true,
        title: Text(
          "Welcome",
          style: primaryFont.copyWith(
              fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Icon(
                Icons.notifications,
                color: secondaryColor,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<ProfileController>(builder: (_) {
        return ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Image.asset("assets/icons/head_banner.png"),
                  Positioned(
                      top: 10,
                      left: -10,
                      child: SvgPicture.asset(
                        profileController.getZodiacSign(
                            profileController.astrologyList.isEmpty
                                ? ""
                                : profileController.astrologyList.first!.sign
                                    .toString()),
                        height: 170,
                      )),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileController.profileData.isEmpty
                              ? ""
                              : profileController.profileData.first.name,
                          style: GoogleFonts.podkova()
                              .copyWith(color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < 22; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Container(
                                  width: 5,
                                  height: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 60,
                                  child: Text(
                                    profileController.astrologyList.isEmpty
                                        ? ""
                                        : profileController
                                            .astrologyList.first!.ascendant
                                            .toString(),
                                    style: GoogleFonts.podkova().copyWith(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  profileController.astrologyList.isEmpty
                                      ? ""
                                      : profileController
                                          .astrologyList.first!.naksahtra
                                          .toString(),
                                  style: GoogleFonts.podkova().copyWith(
                                      color: Colors.white, fontSize: 13),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    style: GoogleFonts.podkova().copyWith(
                                        color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Gothram",
                                      hintStyle: GoogleFonts.podkova().copyWith(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "Gothram",
                                //   style: GoogleFonts.podkova().copyWith(
                                //       color: Colors.white, fontSize: 13),
                                // )
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 60,
                                  child: TextField(
                                    style: GoogleFonts.podkova().copyWith(
                                        color: Colors.white, fontSize: 13),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Kullam",
                                      hintStyle: GoogleFonts.podkova().copyWith(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "Kullam",
                                //   style: GoogleFonts.podkova().copyWith(
                                //       color: Colors.white, fontSize: 13),
                                // )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < 22; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Container(
                                  width: 5,
                                  height: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), //zodiac ended
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Image.asset(
                "assets/icons/Group 1438.png",
                height: 120,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                      Container(
                        color: Colors.yellow,
                        height: 268,
                        child: SvgPicture.string(
                          """<svg width="550" height="550" id="chartSvg" xmlns="http: //www.w3.org/2000/svg"><rect x="0" y="0" width="550" height="550" stroke="black" stroke-width="3" fill="none"></rect><line x1="137.5" y1="0" x2="137.5" y2="550" stroke-width="2" stroke="black"></line><line x1="412.5" y1="0" x2="412.5" y2="550" stroke-width="2" stroke="black"></line><line x1="0" y1="137.5" x2="550" y2="137.5" stroke-width="2" stroke="black"></line><line x1="0" y1="412.5" x2="550" y2="412.5" stroke-width="2" stroke="black"></line><line x1="0" y1="275" x2="137.5" y2="275" stroke-width="2" stroke="black"></line><line x1="412.5" y1="275" x2="550" y2="275" stroke-width="2" stroke="black"></line><line x1="275" y1="0" x2="275" y2="137.5" stroke-width="2" stroke="black"></line><line x1="275" y1="412.5" x2="275" y2="550" stroke-width="2" stroke="black"></line><text font-size="18.333333333333332px">?????? ?????? </text><text font-size="18.333333333333332px" x="151.25" y="34.375" style="fill: black;">?????? ?????? </text><text font-size="18.333333333333332px">?????? </text><text font-size="18.333333333333332px" x="288.75" y="34.375" style="fill: black;">?????? </text><text font-size="18.333333333333332px">??????  </text><text font-size="18.333333333333332px" x="426.25" y="34.375" style="fill: black;">??????  </text><text font-size="18.333333333333332px"> </text><text font-size="22.916666666666668px" x="426.25" y="220" style="fill: blue;"></text><text font-size="18.333333333333332px">?????? </text><text font-size="18.333333333333332px" x="426.25" y="309.375" style="fill: black;">?????? </text><text font-size="18.333333333333332px"> </text><text font-size="18.333333333333332px">????????? </text><text font-size="18.333333333333332px" x="288.75" y="446.875" style="fill: black;">????????? </text><text font-size="18.333333333333332px"> </text><text font-size="18.333333333333332px">??????  </text><text font-size="18.333333333333332px" x="13.75" y="446.875" style="fill: black;">??????  </text><text font-size="18.333333333333332px">????????? </text><text font-size="18.333333333333332px" x="13.75" y="309.375" style="fill: black;">????????? </text><text font-size="18.333333333333332px"> </text><text font-size="18.333333333333332px">?????? </text><text font-size="18.333333333333332px" x="13.75" y="34.375" style="fill: black;">?????? </text></svg>""",
                          height: 268,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<ProfileController>(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => BookingView());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/booking_icon.svg"),
                        Text(
                          "Booking",
                          style: primaryFont.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => DonationsView());
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/icons/donations.svg"),
                        Text(
                          "Donate",
                          style: primaryFont.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TemplesView());
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/icons/temples.svg"),
                        Text(
                          "Temple",
                          style: primaryFont.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  if (authController.isAdmin.isTrue)
                    InkWell(
                      onTap: () {
                        Get.to(() => AdminView());
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/images/Admin.svg"),
                          Text(
                            "Sankalp",
                            style: primaryFont.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    )
                ],
              );
            }),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 115,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/icons/NoPath - Copy (8).png",
                        ),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Suggested:",
                                    style: primaryFont.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                    text: " Monday to Tuesday",
                                    style: primaryFont.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        color: secondaryColor),
                                  )
                                ])),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(
                                    text:
                                        """Karthika Deepam, also called Thiruvannamalai Deepam is a festival of lights that is observed mainly by Hindu Tamils, and also by adherents in the regions of Kerala, Andhra Pradesh, Telangana, Karnataka, and Sri Lanka
                        """,
                                    style: primaryFont.copyWith(
                                        color: Colors.black, fontSize: 9)))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Temples:",
                              style: primaryFont.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/icons/Image 8.png"),
                                Text(
                                  "Thiruvannmalai\nTemple Today\nFestival Deepam.",
                                  style: primaryFont.copyWith(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        );
      }),
    );
  }
}
