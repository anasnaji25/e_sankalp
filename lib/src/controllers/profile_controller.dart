import 'package:e_sankalp/src/controllers/auth_controller.dart';
import 'package:e_sankalp/src/models/add_family_member_api.dart';
import 'package:e_sankalp/src/models/gat_family_members_model.dart';
import 'package:e_sankalp/src/models/profile_models.dart';
import 'package:e_sankalp/src/models/support_model.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/add_family_memeber_api_services.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/get_family_members.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/get_profile_api_services.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/update_profile_api_services.dart';
import 'package:e_sankalp/src/services/network/support_api_services/support_api.dart';
import 'package:e_sankalp/src/services/network/temple_api_services/get_my_bookings_list_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  GetProfileApiServices getProfileApi = GetProfileApiServices();
  UpdateProfileApi updateProfileApi = UpdateProfileApi();
  AddFamilyServicesApi addFamilyServicesApi = AddFamilyServicesApi();
  GetFamilyServicesApi getFamilyServicesApi = GetFamilyServicesApi();

  SupportServicesApi supportServicesApi = SupportServicesApi();

  

  List<ProfileUser> profileData = [];

  List<Member> membersList = [];

  getProfile() async {
    profileData.clear();
    dio.Response<dynamic> response = await getProfileApi.getProfile();
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      profileData.add(profileModel.user);
      if (profileModel.user.role == "Admin") {
        Get.find<AuthController>().isAdmin(true);
      } else {
        Get.find<AuthController>().isAdmin(false);
      }
      update();
      Get.find<AuthController>().update();
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

  addFamilyMember(AddFamilyModel addFamilyModel) async {
    dio.Response<dynamic> response =
        await addFamilyServicesApi.addFamily(addFamilyModel);
    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar(
        "Family member added Successfully",
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
      getFamilyMembers();
    }
  }

  getFamilyMembers() async {
    dio.Response<dynamic> response =
        await getFamilyServicesApi.getFamilyMembers();

    if (response.statusCode == 200) {
      FamilyMembersModel familyMembersModel =
          FamilyMembersModel.fromJson(response.data);
      membersList = familyMembersModel.member;
      update();
    }
  }

  askSupport(SupportModel supportModel) async {
    dio.Response<dynamic> response =
        await supportServicesApi.support(supportModel);

    if (response.statusCode == 200) {
      Get.snackbar(
        "Thank you for submitting",
        "we will contact you",
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
        "",
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
