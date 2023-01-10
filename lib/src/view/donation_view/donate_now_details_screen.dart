import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/donation_amount_controller.dart';
import 'package:e_sankalp/src/models/donaton_list_model.dart';
import 'package:e_sankalp/src/view/home_view/donation_amount.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonateNowDetailsScreen extends StatefulWidget {
  DonateData donateData;
  DonateNowDetailsScreen({super.key, required this.donateData});

  @override
  State<DonateNowDetailsScreen> createState() => _DonateNowDetailsScreenState();
}

class _DonateNowDetailsScreenState extends State<DonateNowDetailsScreen> {
  final donorsController = Get.find<DonationController>();

  @override
  void initState() {
    super.initState();
    donorsController.getSupporters(widget.donateData.id.toString());
  }

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
        child: GetBuilder<DonationController>(builder: (_) {
          return ListView(
            children: [
              Text(
                widget.donateData.donateTitle,
                style: primaryFont.copyWith(
                    fontSize: 19, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.donateData.donateDescription.split(",").first,
                style: primaryFont.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  width: size.width,
                  child: Image.network(widget.donateData.image)),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.donateData.donateDescription.split(",").last,
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
                              "₹${widget.donateData.raisedOfGoal}",
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
                              "₹${widget.donateData.archievedGoal}",
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
                      width: donorsController.donationsList.length > size.width
                          ? size.width
                          : (donorsController.donationsList.length.toDouble() *
                              5),
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
                    "${donorsController.supportersList!.length} supporters",
                    style:
                        primaryFont.copyWith(color: Colors.grey, fontSize: 12),
                  ),
                  // Text(
                  //   "10 days left",
                  //   style:
                  //       primaryFont.copyWith(color: Colors.grey, fontSize: 12),
                  // )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
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
                    Column(
                      children: [
                        for (int i = 0;
                            i <
                                (donorsController.supportersList!.length > 3
                                    ? 3
                                    : donorsController.supportersList!.length);
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
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
                                      donorsController.supportersList![i]!.name
                                          .toString(),
                                      style: primaryFont.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "₹${donorsController.supportersList![i]!.amount}",
                                    style: primaryFont.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: InkWell(
          onTap: () {
            Get.to(() => DonationAmount(
                  donateData: widget.donateData,
                ));
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
