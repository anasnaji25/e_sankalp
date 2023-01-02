import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/controllers/profile_controller.dart';
import 'package:e_sankalp/src/models/profile_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../const/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  ProfileUser profileUser;
  MyProfileScreen({super.key, required this.profileUser});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var timeController = TextEditingController();
  var placeController = TextEditingController();

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
        dateOfBirthController.text = formatDate(date, [dd, "-", mm, "-", yyyy]);
      });
    // _selectTime(context);
  }

  _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: primaryColor, // <-- SEE HERE
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
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        time = picked;
        timeController.text = formatDate(
            DateTime(2019, 08, 1, time.hour, time.minute),
            [H, ':', m, ":00"]).toString();
        ;
      });
  }

  @override
  void initState() {
    super.initState();
    setValue();
  }

  setValue() {
    nameController.text = widget.profileUser.name;
    phoneNumberController.text = widget.profileUser.phoneNumber;
    emailController.text = widget.profileUser.email;
    dateOfBirthController.text = widget.profileUser.dob.split(" ").first;
    timeController.text = widget.profileUser.time == null
        ? widget.profileUser.dob.split(" ").last
        : widget.profileUser.time;
    placeController.text = widget.profileUser.place;
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
          child: GetBuilder<ProfileController>(builder: (_) {
            return WillPopScope(
              onWillPop: () {
                Get.back();

                return Get.find<ProfileController>().getProfile();
              },
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
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.find<ProfileController>().getProfile();
                                  Get.back();
                                },
                                child: SvgPicture.asset(
                                    "assets/icons/arrowback.svg")),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("My Profile",
                                style: GoogleFonts.roboto(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: greyColor)),
                          ],
                        ),
                      ),
                    ),
                    //body here
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: TextField(
                        cursorColor: greyColor,
                        controller: phoneNumberController,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  BorderSide(color: greyColor, width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2)),
                          labelText: 'Phone number',
                          labelStyle: TextStyle(color: greyColor),
                          hintText: 'Enter you phone number',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: TextField(
                        cursorColor: greyColor,
                        controller: emailController,
                        readOnly: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  BorderSide(color: greyColor, width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: greyColor),
                          hintText: 'Enter your email',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: TextField(
                        cursorColor: greyColor,
                        controller: dateOfBirthController,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  BorderSide(color: greyColor, width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2)),
                          labelText: 'Date of birth',
                          labelStyle: TextStyle(color: greyColor),
                          hintText: 'select your date of birth',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: TextField(
                        cursorColor: greyColor,
                        controller: timeController,
                        readOnly: true,
                        onTap: () {
                          _selectTime(context);
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  BorderSide(color: greyColor, width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2)),
                          labelText: 'Time',
                          labelStyle: TextStyle(color: greyColor),
                          hintText: 'Select time',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: TextField(
                        cursorColor: greyColor,
                        controller: placeController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  BorderSide(color: greyColor, width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2)),
                          labelText: 'Place',
                          labelStyle: TextStyle(color: greyColor),
                          hintText: 'Enter your place',
                          isDense: true,
                          contentPadding: const EdgeInsets.all(13),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 100),
                      child: InkWell(
                        onTap: () {
                          Get.find<ProfileController>().updateProfile(
                              name: nameController.text,
                              dob: dateOfBirthController.text,
                              place: placeController.text,
                              time: timeController.text);
                        },
                        child: Container(
                          height: 40,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(2)),
                          child: Center(
                            child: Text("Update",
                                style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Container(
                        height: 40,
                        width: size.width,
                        child: Center(
                          child: Text("Cancel",
                              style: GoogleFonts.roboto(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor)),
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffE4E4E4),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                  ]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
