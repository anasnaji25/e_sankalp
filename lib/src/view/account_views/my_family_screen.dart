import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/models/add_family_member_api.dart';
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
  final profileController = Get.find<ProfileController>();

  var fullNameController = TextEditingController();
  var nakshathraTypeController = TextEditingController();
  var dobController = TextEditingController();
  var mobileNumberController = TextEditingController();

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        dobController.text = formatDate(date, [dd, "-", mm, "-", yyyy]);
      });
    // _selectTime(context);
  }

  setDefault() async {
    fullNameController.clear();
    nakshathraTypeController.clear();
    dobController.clear();
    mobileNumberController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.getFamilyMembers();
    setDefault();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/icons/arrowback.svg",)),
            ),
          ],
        ),
        title: Text("My Family",
            style: GoogleFonts.roboto(
                fontSize: 25, fontWeight: FontWeight.w500, color: greyColor)),
      ),
      body: GetBuilder<ProfileController>(builder: (_) {
        return profileController.membersList.isEmpty ? Center(
          child: Text("No Family Members Added",style: primaryFont.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),),
        ) : ListView.builder(
            itemCount: profileController.membersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 70,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profileController.membersList[index].name,
                            style: GoogleFonts.roboto(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(profileController.membersList[index].nakshtraType,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              //fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
        child: InkWell(
          onTap: () {
            showMyDialog(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 40,
              width: size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("+ Add Member",
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
    setDefault();
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      hintText: 'Full name',
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: nakshathraTypeController,
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      hintText: 'Nakshatra type',
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: dobController,
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      hintText: 'Date of birth',
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: mobileNumberController,
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: greyColor, width: 1.5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)),
                      hintText: 'Mobile Number',
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(
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
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 125,
                          decoration: const BoxDecoration(
                            color: Color(0xffE4E4E4),
                          ),
                          child: Center(
                            child: Text("Cancel",
                                style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (fullNameController.text.isNotEmpty &&
                              nakshathraTypeController.text.isNotEmpty &&
                              dobController.text.isNotEmpty &&
                              mobileNumberController.text.isNotEmpty) {
                            AddFamilyModel addFamilyModel = AddFamilyModel(
                                name: fullNameController.text,
                                dob: dobController.text,
                                nakshathraType: nakshathraTypeController.text,
                                mobile: mobileNumberController.text);

                            profileController.addFamilyMember(addFamilyModel);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
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
  }
}
