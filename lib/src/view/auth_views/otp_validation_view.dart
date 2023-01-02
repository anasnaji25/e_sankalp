import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/view/auth_views/choose_language_view.dart';
import 'package:e_sankalp/src/view/auth_views/loading_screen.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationView extends StatefulWidget {
  String phoneNumber;
  OtpVerificationView({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  String otpCode = "";
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 59;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgoud_img (1).jpeg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          "OTP Verification",
                          style: primaryFont.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 35),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We send code to ${widget.phoneNumber}",
                          style: primaryFont.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
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
                                otpCode = pin;
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
                              Get.find<AuthController>().verifyMobileOTPLogin(
                                  widget.phoneNumber, otpCode);
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
                                      Get.find<AuthController>().resendOtp(widget.phoneNumber);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
