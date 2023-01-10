import 'package:e_sankalp/src/const/auth_helpers.dart';
import 'package:e_sankalp/src/models/admin_register_model.dart';
import 'package:e_sankalp/src/models/plannets_model.dart';
import 'package:e_sankalp/src/models/post_astro_model.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/services/network/astrology_api_services/post_astrology_api_services.dart';
import 'package:e_sankalp/src/services/network/astrology_api_services/post_astrology_chart_api.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/admin_register_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/get_planets_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/login_apis/verify_mobile_login_api.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/login_apis/verify_otp_login_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/register_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/verify_email_api_services.dart';
import 'package:e_sankalp/src/services/network/auth_api_services/verify_mobile_otp_api_services.dart';
import 'package:e_sankalp/src/services/network/phone_verification_api_services/check_phone_number_api_services.dart';
import 'package:e_sankalp/src/view/auth_views/loading_screen.dart';
import 'package:e_sankalp/src/view/auth_views/login_screen_view.dart';
import 'package:e_sankalp/src/view/auth_views/otp_validation_view.dart';
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

  AdminRegisterServicesApi adminRegisterServicesApi =
      AdminRegisterServicesApi();

  VerifyMobileLoginApi verifyMobileLoginApi = VerifyMobileLoginApi();
  VerifyOTPLoginApi verifyOTPLoginApi = VerifyOTPLoginApi();

  PostAstrologyServicesApi postAstrologyApi = PostAstrologyServicesApi();

  PostAstrologyChartServicesApi postAstrologyChartServicesApi =
      PostAstrologyChartServicesApi();

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

  registerUser(
      RegisterModel registerModel, PostAstroModel postAstroModel) async {
    final prefs = await SharedPreferences.getInstance();

    dio.Response<dynamic> response = await registerApi.register(registerModel);

    if (response.statusCode == 200) {
      await prefs.setString(authToken, response.data["token"]);
      postAstroDetails(postAstroModel);
      postAstroChartDetails(postAstroModel);
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

  registerAdmin(
      {required AdminRegisterModel adminRegisterModel,
      required PostAstroModel postAstroModel,
      required RegisterModel registerModel}) async {
    final prefs = await SharedPreferences.getInstance();

    dio.Response<dynamic> response = await registerApi.register(registerModel);

    if (response.statusCode == 200) {
      dio.Response<dynamic> adminresponse = await adminRegisterServicesApi
          .adminRegisterApi(adminRegisterModel, response.data["token"]);

      if (adminresponse.statusCode == 200) {
        await prefs.setString(authToken, response.data["token"]);
        postAstroDetails(postAstroModel);
        postAstroChartDetails(postAstroModel);
        isAdmin(true);
        Get.offAll(() => const LoadingScreenView());
        Get.snackbar("Successfully Registered", "",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Something went wrong", "",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  loginWithMobile(String mobilenumber) async {
    dio.Response<dynamic> response =
        await verifyMobileLoginApi.verifyMobileLogin(mobilenumber);

    if (response.statusCode == 200) {
      Get.to(() => OtpVerificationView(
            phoneNumber: mobilenumber,
          ));
    } else {
      Get.snackbar(
        "Invalid User",
        "User not found",
        icon: const Icon(Icons.error_outline, color: Colors.white),
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
  }

  resendOtp(String mobilenumber) async {
    dio.Response<dynamic> response =
        await verifyMobileLoginApi.verifyMobileLogin(mobilenumber);

    if (response.statusCode == 200) {
      Get.snackbar(
        "OTP Sended",
        "",
        icon: Icon(Icons.check_circle_outline_outlined, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.snackbar(
        "Invalid Number",
        "",
        icon: Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  verifyMobileOTPLogin(String mobileNumber, String otp) async {
    dio.Response<dynamic> response =
        await verifyOTPLoginApi.verifyOTPLogin(mobileNumber, otp);
    final prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      await prefs.setString(authToken, response.data["token"]);
      Get.off(() => const LoadingScreenView());
    } else {
      Get.snackbar(
        "Invalid Number",
        "",
        icon: const Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  postAstroDetails(PostAstroModel postAstroModel) async {
    dio.Response<dynamic> response =
        await postAstrologyApi.postAstrology(postAstroModel);

    if (response.statusCode == 200) {}
  }

  postAstroChartDetails(PostAstroModel postAstroModel) async {
    dio.Response<dynamic> response =
        await postAstrologyChartServicesApi.postAstrologyChart(postAstroModel);

    if (response.statusCode == 200) {}
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authToken, "null");
    Get.offAll(() => LoginView());
  }
}
