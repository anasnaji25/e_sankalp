import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/view/home_view/donation_amount.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonateNowDetailsScreen extends StatefulWidget {
  DonateNowDetailsScreen({super.key});

  @override
  State<DonateNowDetailsScreen> createState() => _DonateNowDetailsScreenState();
}

class _DonateNowDetailsScreenState extends State<DonateNowDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Donate Now",
          style: primaryFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Text(
              "800-year-old Shiva, Perumal temples in Perambalur crying for attention.",
              style: primaryFont.copyWith(
                  fontSize: 19, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Residents and youths have filed petitions with the District Collector and the Hindu Religious and Charitable Endowments Department (HR & CE) demanding renovation of the temples",
              style: primaryFont.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset("assets/images/Perambalur-temple1-EPS (1).png"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "PERAMBALUR: The 800-year-old Shiva and Perumal temples in Maruvathur village of Kunnam Taluk have been left unmaintained for several years with no basic facilities such as drinking water, compound walls and walkway, among others. Due to this, footfall has been on the decline. More than 120 acres of the land belong to the temples.",
              style: primaryFont.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 5, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Raised of Goal",
                            style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹7,30,000",
                            style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 5, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Archived",
                            style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹5,30,000",
                            style: primaryFont.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 14,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.withOpacity(0.4)),
              child: Row(
                children: [
                  Container(
                    height: 14,
                    width: size.width - 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "539 supporters",
                  style: primaryFont.copyWith(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "10 days left",
                  style: primaryFont.copyWith(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        Image.asset("assets/images/8665991_trophy_icon.png"),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Top Donors",
                          style: primaryFont.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Image.asset("assets/images/Group 1438.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Aswini",
                            style: primaryFont.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "₹85000",
                          style: primaryFont.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Image.asset("assets/images/Group 1438.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "K Vasireddy",
                            style: primaryFont.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "₹75000",
                          style: primaryFont.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: InkWell(
          onTap: () {
            Get.to(() => DonationAmount());
          },
          child: Container(
              height: 55,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Donate Now",
                style: primaryFont.copyWith(color: Colors.white, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
