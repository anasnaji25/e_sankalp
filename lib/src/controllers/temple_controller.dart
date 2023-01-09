import 'package:e_sankalp/src/models/gat_family_members_model.dart';
import 'package:e_sankalp/src/models/my_booking_temples_model.dart';
import 'package:e_sankalp/src/models/temple_detail_model.dart';
import 'package:e_sankalp/src/models/temple_list_model.dart';
import 'package:e_sankalp/src/services/network/admin_bookings_api_services/get_admin_bookings_api_services.dart';
import 'package:e_sankalp/src/services/network/profile_api_services/get_family_members.dart';
import 'package:e_sankalp/src/services/network/temple_api_services/get_temple_details_by_id.dart';
import 'package:e_sankalp/src/services/network/temple_api_services/get_temple_list_api.dart';
import 'package:e_sankalp/src/services/network/temple_api_services/temple_pooja_booking_api_services.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

import '../services/network/temple_api_services/get_my_bookings_list_api.dart';

class TempleController extends GetxController {
  RxInt priestAmount = 5.obs;
  RxInt offeringAmount = 20.obs;
  RxInt totalAmount = 25.obs;

  RxInt pujaIndex = 0.obs;
  RxString pujaName = "".obs;
  RxString timeString = "HH:SS:MM".obs;
  RxString timeSelected = "Morning".obs;

  List<TempleSpListModel> templeDataList = [];
  List<TempleDetail> templeDetails = [];

  List<Member> membersList = [];

  List<BookingList> bookingList = [];
  List<BookingList> adminBookingList = [];

  GetTepleListServicesApi getTempleListApi = GetTepleListServicesApi();

  GetTemplesByidApiServices getTempleByIdApi = GetTemplesByidApiServices();
  GetFamilyServicesApi getFamilyServicesApi = GetFamilyServicesApi();

  GetmyBookedTemplesAPIServices getMyBookedTemplesAPIServices =
      GetmyBookedTemplesAPIServices();

  TempleBookingApiServices templeBookingApiServices =
      TempleBookingApiServices();

  GetAdminBookedTemplesAPIServices getAdminBookedTemplesAPIServices =
      GetAdminBookedTemplesAPIServices();

  getTempleList() async {
    dio.Response<dynamic> response = await getTempleListApi.getTempleList();

    if (response.statusCode == 200) {
      TempleListModel templeListModel = TempleListModel.fromJson(response.data);
      makeSeperatedList(templeListModel.temple!.data);
    }
  }

  makeSeperatedList(List<TempleData> templeList) {
    List<TempleSpListModel> templeR = [];

    int neededCount = 4;
    int currentNode = 0;
    List<TempleData> l1 = [];
    List<TempleData> l2 = [];
    for (int i = 0; i < templeList.length; i++) {
      if (currentNode == neededCount) {
        currentNode = 0;
        TempleSpListModel tmodel = TempleSpListModel(l1: l1, l2: l2);
        templeR.add(tmodel);
        l1 = [];
        l2 = [];
        if (currentNode == 0) {
          l1.add(templeList[i]);
        } else {
          l2.add(templeList[i]);
        }
        currentNode++;
      } else if (templeList.last == templeList[i]) {
        if (currentNode == 0) {
          l1.add(templeList[i]);
        } else {
          l2.add(templeList[i]);
        }
        TempleSpListModel tmodel = TempleSpListModel(l1: l1, l2: l2);
        templeR.add(tmodel);
      } else {
        if (currentNode == 0) {
          l1.add(templeList[i]);
        } else {
          l2.add(templeList[i]);
        }
        currentNode++;
      }
    }

    templeDataList = templeR;

    update();
  }

  Future<List<TempleDetail>> getTempleDetailsById({required String id}) async {
    templeDetails.clear();
    dio.Response<dynamic> response = await getTempleByIdApi.getTempleById(id);

    if (response.statusCode == 200) {
      TempleDetailsModel templeDetailsModel =
          TempleDetailsModel.fromJson(response.data);
      templeDetails = templeDetailsModel.templeDetails;
      update();
    }

    return templeDetails;
  }

  bookPooja(
      {required String templeId,
      required String time,
      required String session,
      required String preiestAmount,
      required String poojaName,
      required String offerAmount,
      required String totalAmount,
      required DateTime poojaDate,
      required List<dynamic> memeberList}) async {
    dio.Response<dynamic> response = await templeBookingApiServices.bookTemple(
        templeId,
        time,
        session,
        preiestAmount,
        poojaName,
        offerAmount,
        totalAmount,
        poojaDate,
        memeberList);

    if (response.statusCode == 200) {
      Get.snackbar(
        "pooja booked Successfully",
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
      Get.offAll(() => HomePageWithNavigation(
            index: 0,
          ));
    }
  }

  getMyBookingsList() async {
    dio.Response<dynamic> response =
        await getMyBookedTemplesAPIServices.getmyBookedTemples();

    if (response.statusCode == 200) {
      MyBookingsModel myBookingsModel = MyBookingsModel.fromJson(response.data);
      bookingList = myBookingsModel.bookingList;
      update();
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

  getAdminBookingList() async {
    print(".............................................");
    dio.Response<dynamic> response =
        await getAdminBookedTemplesAPIServices.getAdminBookedTemples();
    print(".............................................");
    if (response.statusCode == 200) {
      MyBookingsModel myBookingsModel = MyBookingsModel.fromJson(response.data);
      adminBookingList = myBookingsModel.bookingList;
      print(".............................................");
      print(adminBookingList.length);
      update();
    }
  }
}

class TempleSpListModel {
  List<TempleData> l1;
  List<TempleData> l2;

  TempleSpListModel({required this.l1, required this.l2});
}
