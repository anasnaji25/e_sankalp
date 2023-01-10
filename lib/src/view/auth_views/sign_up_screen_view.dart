import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/models/post_astro_model.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/view/auth_views/admin_signup_info_view.dart';
import 'package:e_sankalp/src/view/auth_views/loading_screen.dart';
import 'package:e_sankalp/src/view/auth_views/login_screen_view.dart';
import 'package:e_sankalp/src/view/auth_views/otp_validation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var _dateController = TextEditingController();

  final authController = Get.find<AuthController>();

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  bool isAdmin = false;

  var nameController = TextEditingController();
  var mobileNumController = TextEditingController();
  var emailIdController = TextEditingController();
  var placeController = TextEditingController();

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
  void initState() {
    super.initState();
    authController.isMobileAvailable(true);
    authController.isMobileNumberVerified(false);
    authController.getPlanetsList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgoud_img (6).jpeg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
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
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  hintText: "Name",
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
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              controller: mobileNumController,
                              decoration: InputDecoration(
                                  hintText: "Mobile Number",
                                  suffixIcon: authController
                                          .isMobileNumberVerified.isTrue
                                      ? const Icon(
                                          Icons.verified,
                                          color: Colors.green,
                                        )
                                      : Container(
                                          width: 1,
                                          height: 1,
                                        ),
                                  prefix: Text("+91"),
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
                          const SizedBox(
                            height: 5,
                          ),
                          if (authController.isMobileNumberVerified.isFalse)
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: InkWell(
                                onTap: () {
                                  if (mobileNumController.text.isNotEmpty &&
                                      mobileNumController.text.length == 10) {
                                    authController
                                        .verifyMobile(mobileNumController.text);
                                    _showOTPDialouge(
                                        context, mobileNumController.text);
                                  } else {
                                    Get.snackbar(
                                        "Enter a valid Phone number", "",
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "OTP Generation",
                                      style: primaryFont.copyWith(
                                          color: primaryColor, fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              controller: emailIdController,
                              decoration: InputDecoration(
                                  hintText: "Email ID",
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: () {
                                _showOTPDialouge(context, "");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "OTP Generation",
                                    style: primaryFont.copyWith(
                                        color: primaryColor, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              readOnly: true,
                              controller: _dateController,
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: InputDecoration(
                                  hintText: "DD/MM/Year and Time",
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
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              controller: placeController,
                              decoration: InputDecoration(
                                  hintText: "Place",
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
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: !isAdmin,
                                        activeColor: primaryColor,
                                        onChanged: (val) {
                                          setState(() {
                                            isAdmin = !val!;
                                          });
                                        }),
                                    Text(
                                      "Customer",
                                      style: GoogleFonts.lexend().copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: isAdmin,
                                        activeColor: primaryColor,
                                        onChanged: (val) {
                                          setState(() {
                                            isAdmin = val!;
                                          });
                                        }),
                                    Text(
                                      "Sankalp",
                                      style: GoogleFonts.lexend().copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: InkWell(
                              onTap: () async {
                                // if (isAdmin) {
                                //   Get.off(() => SignupAdminView());
                                // } else {
                                //   Get.find<AuthController>().isAdmin(false);
                                //   Get.off(() => LoadingScreenView());
                                // }

                                if (nameController.text.isNotEmpty &&
                                    mobileNumController.text.isNotEmpty &&
                                    emailIdController.text.isNotEmpty &&
                                    placeController.text.isNotEmpty &&
                                    _dateController.text.isNotEmpty) {
                                  if (authController
                                      .isMobileNumberVerified.isTrue) {
                                    if (isAdmin) {
                                      RegisterModel registerModel = RegisterModel(
                                          name: nameController.text,
                                          phoneNumber: mobileNumController.text,
                                          dob:
                                              "${date.day}-${date.month}-${date.year} ${time.hour}:${time.minute}:00",
                                          email: emailIdController.text,
                                          place: placeController.text,
                                          role: "Admin");

                                           List<Location> locations =
                                          await locationFromAddress(
                                              placeController.text);

                                      PostAstroModel postAstroModel =
                                          PostAstroModel(
                                              day: date.day.toString(),
                                              month: date.month.toString(),
                                              year: date.year.toString(),
                                              hour: time.hour.toString(),
                                              min: time.minute.toString(),
                                              tzone: "5.5",
                                              lat:locations.isEmpty  ? "13.0827": locations.first.latitude
                                                  .toString(),
                                              long: locations.isEmpty
                                                  ? "80.2707"
                                                  :  locations.first.longitude
                                                  .toString(),
                                              language: 'ta');

                                      Get.off(() => SignupAdminView(
                                            registerModel: registerModel,
                                            postAstroModel: postAstroModel,
                                          ));
                                    } else {
                                      RegisterModel registerModel = RegisterModel(
                                          name: nameController.text,
                                          phoneNumber: mobileNumController.text,
                                          dob:
                                              "${date.day}-${date.month}-${date.year} ${time.hour}:${time.minute}:00",
                                          email: emailIdController.text,
                                          place: placeController.text,
                                          role: "Customer");

                                      List<Location> locations =
                                          await locationFromAddress(
                                              placeController.text);

                                      PostAstroModel postAstroModel =
                                          PostAstroModel(
                                              day: date.day.toString(),
                                              month: date.month.toString(),
                                              year: date.year.toString(),
                                              hour: time.hour.toString(),
                                              min: time.minute.toString(),
                                              tzone: "5.5",
                                             lat: locations.isEmpty
                                                  ? "13.0827"
                                                  : locations.first.latitude
                                                      .toString(),
                                              long: locations.isEmpty
                                                  ? "80.2707"
                                                  : locations.first.longitude
                                                      .toString(),
                                              language: 'ta');

                                      authController
                                          .registerUser(registerModel, postAstroModel);
                                    }
                                  } else {
                                    Get.snackbar(
                                        "Please Verify your mobile Number", "",
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                } else {
                                  Get.snackbar("Fill all the fields", "",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM);
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

  String otpNum = "";
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 59;
  Future<void> _showOTPDialouge(
      BuildContext context, String mobileNumber) async {
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 59;
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
                      "We send code to $mobileNumber",
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
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 44,
                    style: const TextStyle(fontSize: 18),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      // print("Completed: " + pin);
                      setState(() {
                        otpNum = pin;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () {
                      if (otpNum.length == 4) {
                        Get.find<AuthController>()
                            .verifyMobileOtp(mobileNumber, otpNum);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: secondaryColor),
                      alignment: Alignment.center,
                      child: Text(
                        "Verify",
                        style: primaryFont.copyWith(
                            color: Colors.white, fontSize: 19),
                      ),
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
                    CountdownTimer(
                      endTime: endTime,
                      widgetBuilder: (_, CurrentRemainingTime? time) {
                        if (time == null) {
                          return InkWell(
                            onTap: () {
                              authController.verifyMobile(mobileNumber);
                            },
                            child: Text('Resend',
                                style: primaryFont.copyWith(
                                    color: primaryColor, fontSize: 16)),
                          );
                        }
                        return Text("Resend OTP in ${time.sec} Seconds",
                            style: primaryFont.copyWith(
                                color: primaryColor, fontSize: 16));
                      },
                    ),
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
}
