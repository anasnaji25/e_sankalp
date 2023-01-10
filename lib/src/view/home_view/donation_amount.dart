import 'package:e_sankalp/src/controllers/donation_amount_controller.dart';
import 'package:e_sankalp/src/models/donate_model.dart';
import 'package:e_sankalp/src/models/donaton_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class DonationAmount extends StatefulWidget {
  DonateData donateData;
  DonationAmount({super.key, required this.donateData});

  @override
  State<DonationAmount> createState() => _DonationAmountState();
}

class _DonationAmountState extends State<DonationAmount> {
  final donationController = Get.find<DonationController>();
  bool isCheked = false;

  var customAmountTextController = TextEditingController();
  var nameController = TextEditingController();
  var emailIdController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var stateController = TextEditingController();
  var pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    customAmountTextController.text = "300";
  }

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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: size.width,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/arrowback.svg"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Donation Amount",
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: greyColor)),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/notification.svg"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //body here
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("Choose Amount",
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            // color: greyColor
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                          "Most Donors donate approx ₹1000 to this Fundraiser",
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff9C9B9B))),
                    ),
                    Obx(
                      () => (Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 0, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                donationController.index(0);
                                setState(() {
                                  customAmountTextController.text = "300";
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: donationController.index.value == 0
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(
                                      color: const Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xff00000029), //New
                                      blurRadius: 5.5,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text("₹300",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            donationController.index.value == 0
                                                ? Colors.white
                                                : Color(0xff9C9B9B),
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                donationController.index(1);
                                setState(() {
                                  customAmountTextController.text = "500";
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: donationController.index.value == 1
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(
                                      color: const Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xff00000029), //New
                                      blurRadius: 5.5,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text("₹500",
                                      style: GoogleFonts.roboto(
                                        color:
                                            donationController.index.value == 1
                                                ? Colors.white
                                                : Color(0xff9C9B9B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        //color: Color(0xff9C9B9B)
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                donationController.index(2);
                                setState(() {
                                  customAmountTextController.text = "700";
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: donationController.index.value == 2
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff00000029), //New
                                      blurRadius: 5.5,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text("₹700",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            donationController.index.value == 2
                                                ? Colors.white
                                                : Color(0xff9C9B9B),
                                        //color: Color(0xff9C9B9B)
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                donationController.index(3);
                                customAmountTextController.text = "1000";
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: donationController.index.value == 3
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(
                                      color: const Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff00000029), //New
                                      blurRadius: 5.5,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text("₹1000",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            donationController.index.value == 3
                                                ? Colors.white
                                                : const Color(0xff9C9B9B),
                                        //color: Color(0xff9C9B9B)
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: customAmountTextController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              // labelText: 'Pincode',
                              // labelStyle: TextStyle(color: greyColor),
                              labelText: 'Custom Amount',
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "Please enter a value greater than or equal to ₹ 300.",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.roboto(
                                      fontSize: 9,
                                      //fontWeight: FontWeight.w500,
                                      color: lightGreyColor)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: 'Enter Full Name Here',
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: const Color(0xff517937),
                                value: isCheked,
                                onChanged: (value) {
                                  setState(() {
                                    isCheked = !isCheked;
                                  });
                                }),
                            Text("Make my donation anonymous",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    //fontWeight: FontWeight.w500,
                                    color: lightGreyColor)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 0),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: emailIdController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Email ID',
                              labelStyle: TextStyle(color: greyColor),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 30),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: greyColor),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 30),
                          child: TextField(
                            controller: addressController,
                            cursorColor: greyColor,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Address',
                              labelStyle: TextStyle(color: greyColor),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 30),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: stateController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'State',
                              labelStyle: TextStyle(color: greyColor),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 30),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: countryController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Country',
                              labelStyle: TextStyle(color: greyColor),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 30),
                          child: TextField(
                            cursorColor: greyColor,
                            controller: pinCodeController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              labelText: 'Pincode',
                              labelStyle: TextStyle(color: greyColor),
                              hintText: '600028',
                              isDense: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: InkWell(
                            onTap: () {
                              if (addressController.text.isNotEmpty &&
                                  customAmountTextController.text.isNotEmpty &&
                                  countryController.text.isNotEmpty &&
                                  emailIdController.text.isNotEmpty &&
                                  nameController.text.isNotEmpty &&
                                  phoneNumberController.text.isNotEmpty &&
                                  pinCodeController.text.isNotEmpty &&
                                  stateController.text.isNotEmpty) {
                                DonationModel donationModel = DonationModel(
                                  address: addressController.text,
                                  amount: customAmountTextController.text,
                                  country: countryController.text,
                                  emailId: emailIdController.text,
                                  isAnonyms: isCheked,
                                  name: nameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  pincode: pinCodeController.text,
                                  state: stateController.text,
                                  id: widget.donateData.id.toString(),
                                );
                                donationController.donateNow(donationModel);
                              } else {
                                Get.snackbar(
                                  "Fill all the fields",
                                  "",
                                  icon: const Icon(
                                      Icons.check_circle_outline_outlined,
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
                              height: 30,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                    "Proceed To Pay ₹${customAmountTextController.text}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("By continuing, you agree to our",
                                style: GoogleFonts.roboto(
                                  fontSize: 11,
                                  //fontWeight: FontWeight.w500,
                                  // color: Colors.white
                                )),
                            Text(" Terms Of Service ",
                                style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    //fontWeight: FontWeight.w500,
                                    color: Color(0xff10D2D9))),
                            Text("and",
                                style: GoogleFonts.roboto(
                                  fontSize: 11,
                                  //fontWeight: FontWeight.w500,
                                  // color: Colors.white
                                )),
                            Text(" Privacy Policy",
                                style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    //fontWeight: FontWeight.w500,
                                    color: Color(0xff10D2D9))),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
