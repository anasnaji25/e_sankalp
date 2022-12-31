import 'package:e_sankalp/src/const/auth_helpers.dart';
import 'package:e_sankalp/src/models/plannets_model.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/get_planets_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/register_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/verify_email_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/verify_mobile_otp_api_services.dart';
import 'package:e_sankalp/src/services/network/phone_verification_api_services/check_phone_number_api_services.dart';
import 'package:e_sankalp/src/view/auth_views/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxInt langIndex = 0.obs;

  RxBool isAdmin = false.obs;

  RxBool isPoojariBankEnabled = false.obs;
  RxBool isTempleBankEnabled = false.obs;
  RxBool isTempleContactEnabled = false.obs;
  RxBool isArchanTicketEnabled = false.obs;

  RxBool isMobileAvailable = true.obs;

  RxBool isMobileNumberVerified = false.obs;

  VerifyMobileServicesApi verifyMobileApi = VerifyMobileServicesApi();

  VerifyMobileOTPServicesApi verifyMobileOtpAPi = VerifyMobileOTPServicesApi();

  VerifyEmailServicesApi verifyEmailApi = VerifyEmailServicesApi();

  RegisterServicesApi registerApi = RegisterServicesApi();

  GetPlanetsApiServices getPlanetsApiServices = GetPlanetsApiServices();

  List<PlanetsModel> plantsList = [];

  verifyMobile(String mobile) async {
    dio.Response<dynamic> response = await verifyMobileApi.verifyMobile(mobile);

    if (response.statusCode == 200) {
      Get.snackbar("Mobile Verification OTP Successfully sended", "",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Mobile number is already taken", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
      isMobileAvailable(false);
    }
  }

  verifyMobileOtp(String mobileNumber, String otp) async {
    dio.Response<dynamic> response =
        await verifyMobileOtpAPi.verifyMobileOTP(mobileNumber, otp);

    if (response.statusCode == 200) {
      isMobileNumberVerified(true);
      Get.back();
      Get.snackbar("Mobile Number Verified Successfully", "",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Invalid Otp", "try again",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  registerUser(RegisterModel registerModel) async {
    final prefs = await SharedPreferences.getInstance();

    dio.Response<dynamic> response = await registerApi.register(registerModel);

    if (response.statusCode == 200) {
      await prefs.setString(authToken, response.data["token"]);
      isAdmin(false);
      Get.offAll(() => const LoadingScreenView());
      Get.snackbar("Successfully Registered", "",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Something went wrong", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  getPlanetsList() async {
    dio.Response<dynamic> response = await getPlanetsApiServices.getPlanets();

    if (response.statusCode == 200) {
      plantsList = planetsModelFromJson(response.data);
    }
    update();
  }
}
