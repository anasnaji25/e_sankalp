import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/models/admin_register_model.dart';
import 'package:e_sankalp/src/models/plannets_model.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/view/auth_views/loading_screen.dart';
import 'package:e_sankalp/src/view/auth_views/login_screen_view.dart';
import 'package:e_sankalp/src/view/auth_views/otp_validation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class SignupAdminView extends StatefulWidget {
  RegisterModel registerModel;
  SignupAdminView({super.key, required this.registerModel});

  @override
  State<SignupAdminView> createState() => _SignupAdminViewState();
}

class _SignupAdminViewState extends State<SignupAdminView> {
  var _dateController = TextEditingController();

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  final authController = Get.find<AuthController>();
  // bool isAdmin = false;

  var selectedPlanet;
  String imageName = "";
  String timageName = "Poojari(aadhar-pan-licence-voter id)";
  var templeNameTxtCntrl = TextEditingController();
  var deityNameTxtCmntrl = TextEditingController();
  var specialityPlanetTxtCntrl = TextEditingController();
  var hrncTxtContrl = TextEditingController();
  var organisationTxtCntrl = TextEditingController();
  var inChargePersonTxtCntrl = TextEditingController();
  var inChargePersonContactTxtCntrl = TextEditingController();
  var poojariNameTxtController = TextEditingController();
  var poojariContactNumTxtcntrl = TextEditingController();
  var poojariBankNameTxtCntrl = TextEditingController();
  var poojariAccountNumberTxtControl = TextEditingController();
  var pooojariIfscTxtControl = TextEditingController();
  var poojariUpiTxtController = TextEditingController();
  var templeAccontNameTxtCntrl = TextEditingController();
  var templeAccontNunberTxtCntrl = TextEditingController();
  var templeIfscCodeTxtCntrl = TextEditingController();
  var templeUPITxtCntrl = TextEditingController();
  var templeAddressTxtCntrl = TextEditingController();
  var templePhoneTxtCntrol = TextEditingController();
  var archanaTicket1TxtCntrl = TextEditingController();
  var archanaTicket2TxtCntrl = TextEditingController();
  var archanaTicket3TxtCntrl = TextEditingController();
  var archanaTicket4TxtCntrl = TextEditingController();
  var archanaTicket5TxtCntrl = TextEditingController();
  var archanaTicketName1TxtCntrl = TextEditingController();
  var archanaTicketName2TxtCntrl = TextEditingController();
  var archanaTicketName3TxtCntrl = TextEditingController();
  var archanaTicketName4TxtCntrl = TextEditingController();
  var archanaTicketName5TxtCntrl = TextEditingController();
  var archanaVeehicleCoastTxtCntrl = TextEditingController();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
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
        _dateController.text = DateFormat.yMMMEd().format(date);
      });
    _selectTime(context);
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
      setState(() {
        time = picked;

        _dateController.text = _dateController.text +
            " " +
            formatDate(DateTime(2019, 08, 1, time.hour, time.minute),
                [hh, ':', nn, " ", am]).toString();
        ;
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/icons/logo.png",
                    height: 140,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign Up",
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 40),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: templeNameTxtCntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Temple Name",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: deityNameTxtCmntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Deity name",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Container(
                                height: 50,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(color: primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButton<PlanetsModel>(
                                      borderRadius: BorderRadius.circular(7),
                                      value: selectedPlanet,
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      elevation: 12,
                                      itemHeight: 50,
                                      isDense: true,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      hint: Text(
                                        "Speciality planet",
                                        style:
                                            primaryFont.copyWith(fontSize: 14),
                                      ),
                                      onChanged: (PlanetsModel? value) {
                                        setState(() {
                                          selectedPlanet = value!;
                                        });
                                      },
                                      items: authController.plantsList
                                          .map<DropdownMenuItem<PlanetsModel>>(
                                              (PlanetsModel value) {
                                        return DropdownMenuItem<PlanetsModel>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: hrncTxtContrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "HRNC",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: organisationTxtCntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Controlling Organisation",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: inChargePersonTxtCntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Person in charge",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: inChargePersonContactTxtCntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText:
                                        "Person in Charge contact details",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: poojariNameTxtController,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Poojari Name",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: poojariContactNumTxtcntrl,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Poojari contact",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: primaryColor))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: InkWell(
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                // Pick an image
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  imageName = image!.path;
                                  timageName = image.name;
                                });
                              },
                              child: Container(
                                height: 50,
                                child: TextField(
                                  readOnly: true,
                                  onTap: () async {
                                    final ImagePicker _picker = ImagePicker();
                                    // Pick an image
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      imageName = image!.path;
                                      timageName = image.name;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: timageName,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide:
                                              BorderSide(color: primaryColor)),
                                      suffixIcon: Icon(
                                        Icons.upload,
                                        color: secondaryColor,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide:
                                              BorderSide(color: primaryColor))),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: InkWell(
                                  onTap: () {
                                    authController.isPoojariBankEnabled(
                                        !authController
                                            .isPoojariBankEnabled.value);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Poojari bank details",
                                            style: primaryFont.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          authController
                                                  .isPoojariBankEnabled.isFalse
                                              ? const Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.arrow_drop_up_sharp,
                                                  color: Colors.black,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (authController.isPoojariBankEnabled.isTrue)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: secondaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller:
                                                    poojariBankNameTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Name"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    poojariAccountNumberTxtControl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Account"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    pooojariIfscTxtControl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "IFSC Code"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    poojariUpiTxtController,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "UPI ID"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: InkWell(
                                  onTap: () {
                                    authController.isTempleBankEnabled(
                                        !authController
                                            .isTempleBankEnabled.value);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Temple bank details",
                                            style: primaryFont.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          authController
                                                  .isTempleBankEnabled.isFalse
                                              ? const Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.arrow_drop_up_sharp,
                                                  color: Colors.black,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (authController.isTempleBankEnabled.isTrue)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: secondaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller:
                                                    templeAccontNameTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Name"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    templeAccontNunberTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Account"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    templeIfscCodeTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "IFSC Code"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller: templeUPITxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "UPI ID"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: InkWell(
                                  onTap: () {
                                    authController.isTempleContactEnabled(
                                        !authController
                                            .isTempleContactEnabled.value);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Temple contact details",
                                            style: primaryFont.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          authController.isTempleContactEnabled
                                                  .isFalse
                                              ? const Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.arrow_drop_up_sharp,
                                                  color: Colors.black,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (authController.isTempleContactEnabled.isTrue)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: secondaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller:
                                                    templeAddressTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Address"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                              TextField(
                                                controller:
                                                    templePhoneTxtCntrol,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "Phone"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: InkWell(
                                  onTap: () {
                                    authController.isArchanTicketEnabled(
                                        !authController
                                            .isArchanTicketEnabled.value);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Archana ticket cost: 5",
                                            style: primaryFont.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          authController
                                                  .isArchanTicketEnabled.isFalse
                                              ? const Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.arrow_drop_up_sharp,
                                                  color: Colors.black,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (authController.isArchanTicketEnabled.isTrue)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: secondaryColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 15),
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                archanaTicketName1TxtCntrl,
                                                            decoration:
                                                                const InputDecoration
                                                                        .collapsed(
                                                                    hintText:
                                                                        "Pooja 1 Name"),
                                                          ),
                                                           const Divider(
                                                            thickness: 1.5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              archanaTicket1TxtCntrl,
                                                              keyboardType: TextInputType.number,
                                                          decoration:
                                                              const InputDecoration
                                                                      .collapsed(
                                                                  hintText:
                                                                      "Amount"),
                                                        ),
                                                         const Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                             
                                             
                                             Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                archanaTicketName2TxtCntrl,
                                                            decoration:
                                                                const InputDecoration
                                                                        .collapsed(
                                                                    hintText:
                                                                        "Pooja 2 Name"),
                                                          ),
                                                          const Divider(
                                                            thickness: 1.5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              archanaTicket2TxtCntrl,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration
                                                                      .collapsed(
                                                                  hintText:
                                                                      "Amount"),
                                                        ),
                                                        const Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                             
                                             Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                archanaTicketName3TxtCntrl,
                                                            decoration:
                                                                const InputDecoration
                                                                        .collapsed(
                                                                    hintText:
                                                                        "Pooja 3 Name"),
                                                          ),
                                                          const Divider(
                                                            thickness: 1.5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              archanaTicket3TxtCntrl,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration
                                                                      .collapsed(
                                                                  hintText:
                                                                      "Amount"),
                                                        ),
                                                        const Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                archanaTicketName4TxtCntrl,
                                                            decoration:
                                                                const InputDecoration
                                                                        .collapsed(
                                                                    hintText:
                                                                        "Pooja 4 Name"),
                                                          ),
                                                          const Divider(
                                                            thickness: 1.5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              archanaTicket4TxtCntrl,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration
                                                                      .collapsed(
                                                                  hintText:
                                                                      "Amount"),
                                                        ),
                                                        const Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                archanaTicketName5TxtCntrl,
                                                            decoration:
                                                                const InputDecoration
                                                                        .collapsed(
                                                                    hintText:
                                                                        "Pooja 5 Name"),
                                                          ),
                                                          const Divider(
                                                            thickness: 1.5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              archanaTicket5TxtCntrl,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration
                                                                      .collapsed(
                                                                  hintText:
                                                                      "Amount"),
                                                        ),
                                                        const Divider(
                                                          thickness: 1.5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            
                                              TextField(
                                                controller:
                                                    archanaVeehicleCoastTxtCntrl,
                                                decoration:
                                                    const InputDecoration
                                                            .collapsed(
                                                        hintText: "vehicle"),
                                              ),
                                              const Divider(
                                                thickness: 1.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: InkWell(
                              onTap: () {
                                if (templeNameTxtCntrl.text.isNotEmpty &&
                                    deityNameTxtCmntrl.text.isNotEmpty &&
                                    hrncTxtContrl.text.isNotEmpty &&
                                    organisationTxtCntrl.text.isNotEmpty &&
                                    inChargePersonTxtCntrl.text.isNotEmpty &&
                                    inChargePersonContactTxtCntrl
                                        .text.isNotEmpty &&
                                    poojariNameTxtController.text.isNotEmpty &&
                                    poojariContactNumTxtcntrl.text.isNotEmpty &&
                                    poojariBankNameTxtCntrl.text.isNotEmpty &&
                                    poojariAccountNumberTxtControl
                                        .text.isNotEmpty &&
                                    pooojariIfscTxtControl.text.isNotEmpty &&
                                    poojariUpiTxtController.text.isNotEmpty &&
                                    templeAccontNameTxtCntrl.text.isNotEmpty &&
                                    templeAccontNunberTxtCntrl
                                        .text.isNotEmpty &&
                                    templeIfscCodeTxtCntrl.text.isNotEmpty &&
                                    templeUPITxtCntrl.text.isNotEmpty &&
                                    templeAddressTxtCntrl.text.isNotEmpty &&
                                    templePhoneTxtCntrol.text.isNotEmpty &&
                                    archanaTicket1TxtCntrl.text.isNotEmpty &&
                                    selectedPlanet != null) {
                                  PlanetsModel tplanetModel =
                                      selectedPlanet as PlanetsModel;
                                  AdminRegisterModel adminRegisterModel =
                                      AdminRegisterModel(
                                          templeName: templeNameTxtCntrl.text,
                                          deityName: deityNameTxtCmntrl.text,
                                          specialityPlanet: tplanetModel.name,
                                          hrnc: hrncTxtContrl.text,
                                          organisation:
                                              organisationTxtCntrl.text,
                                          inChargePerson:
                                              inChargePersonTxtCntrl.text,
                                          inchanrgePersonContanct:
                                              inChargePersonContactTxtCntrl
                                                  .text,
                                          poojariContactNumber:
                                              poojariContactNumTxtcntrl.text,
                                          pooojariName:
                                              poojariNameTxtController.text,
                                          poojariAuthImage: File(imageName),
                                          poojariBankName:
                                              poojariBankNameTxtCntrl.text,
                                          poojariAccountNum:
                                              poojariAccountNumberTxtControl
                                                  .text,
                                          poojariIfsc:
                                              pooojariIfscTxtControl.text,
                                          poojariUPI:
                                              poojariUpiTxtController.text,
                                          templeAccountName:
                                              templeAccontNameTxtCntrl.text,
                                          templeAccountNumber:
                                              templeAccontNunberTxtCntrl.text,
                                          templeteIfsc:
                                              templeIfscCodeTxtCntrl.text,
                                          templeUPI: templeUPITxtCntrl.text,
                                          templeAddress:
                                              templeAddressTxtCntrl.text,
                                          templePhone:
                                              templePhoneTxtCntrol.text,
                                              archanaticketName1: archanaTicketName1TxtCntrl.text,
                                      archanaticketName2:
                                          archanaTicketName2TxtCntrl.text.isEmpty ? "null": archanaTicketName2TxtCntrl.text,
                                              archanaticketName3:
                                          archanaTicketName3TxtCntrl.text.isEmpty ? "null": archanaTicketName3TxtCntrl.text,
                                      archanaticketName4:
                                          archanaTicketName4TxtCntrl.text.isEmpty ? "null":archanaTicketName4TxtCntrl.text ,
                                      archanaticketName5:
                                          archanaTicketName5TxtCntrl.text.isEmpty ? "null": archanaTicketName5TxtCntrl.text,
                                          archanaticket1:
                                              archanaTicket1TxtCntrl.text.isEmpty ? "null": archanaTicket1TxtCntrl.text,
                                          archanaticket2:
                                              archanaTicket2TxtCntrl.text.isEmpty ? "null": archanaTicket2TxtCntrl.text,
                                          archanaticket3:
                                              archanaTicket3TxtCntrl.text.isEmpty ? "null": archanaTicket3TxtCntrl.text,
                                          archanaticket4:
                                              archanaTicket4TxtCntrl.text.isEmpty ? "null": archanaTicket4TxtCntrl.text,
                                          archanaticket5:
                                              archanaTicket5TxtCntrl.text.isEmpty ? "null": archanaTicket5TxtCntrl.text,
                                          archanaTicketVehicle:
                                              archanaVeehicleCoastTxtCntrl
                                                  .text);

                                  authController.registerAdmin(
                                      adminRegisterModel: adminRegisterModel,
                                      registerModel: widget.registerModel);
                                } else {
                                  Get.snackbar(
                                    "Fill All the Fields",
                                    "Please fill all the fields",
                                    icon: const Icon(Icons.error_outline,
                                        color: Colors.white),
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    borderRadius: 20,
                                    margin: const EdgeInsets.all(15),
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 3),
                                    isDismissible: true,
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    forwardAnimationCurve: Curves.easeOutBack,
                                  );
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: secondaryColor),
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign Up",
                                  style: primaryFont.copyWith(
                                      color: Colors.white, fontSize: 19),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => LoginView());
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: "Already have an account? ",
                                    style: primaryFont.copyWith(
                                        color: Colors.black45, fontSize: 16),
                                    children: [
                                  TextSpan(
                                      text: "Login",
                                      style: primaryFont.copyWith(
                                          color: primaryColor, fontSize: 16)),
                                ])),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showOTPDialouge(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                "OTP Verification",
                style: primaryFont.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 35),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "We send code to 9876543210",
                    style: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 44,
                  style: const TextStyle(fontSize: 18),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    // print("Completed: " + pin);
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: secondaryColor),
                  alignment: Alignment.center,
                  child: Text(
                    "Verify",
                    style:
                        primaryFont.copyWith(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Resend OTP in 44 Seconds",
                        style: primaryFont.copyWith(
                            color: primaryColor, fontSize: 16)),
                  ])),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      );
    },
  );
}
