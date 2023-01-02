import 'package:e_sankalp/src/models/profile_models.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/get_profile_api_services.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/update_profile_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApi = GetProfileApiServices();
  UpdateProfileApi updateProfileApi = UpdateProfileApi();

  List<ProfileUser> profileData = [];

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApi.getProfile();

    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
    }
  }

  updateProfile({required String name, dob, place, time}) async {
    dio.Response<dynamic> response =
        await updateProfileApi.updateProfileAPi(name, dob, place, time);

    if (response.statusCode == 200) {
      Get.snackbar(
        "Profile Updated Successfully",
        "",
        icon: const Icon(Icons.check_circle_outline_outlined,
            color: Colors.white),
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
        "Something went wrong",
        "try again",
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
}