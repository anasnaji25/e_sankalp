import 'package:e_sankalp/src/models/donate_model.dart';
import 'package:e_sankalp/src/models/donaton_list_model.dart';
import 'package:e_sankalp/src/models/donors_list_model.dart';
import 'package:e_sankalp/src/services/network/donations_api_services/donate_api_services.dart';
import 'package:e_sankalp/src/services/network/donations_api_services/get_donors_list_api.dart';
import 'package:e_sankalp/src/view/donation_view/donations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/network/donations_api_services/donations_list_api_services.dart';
import 'package:dio/dio.dart' as dio;

class DonationController extends GetxController {
  RxInt index = 0.obs;

  List<DonateData> donationsList = [];

  List<Donor?>? supportersList = [];

  GetDonationsListAPIServices getDonationsListAPIServices =
      GetDonationsListAPIServices();

  DonateServicesApi donateServicesApi = DonateServicesApi();

  GetSupportersServicesApi getSupportersServicesApi =
      GetSupportersServicesApi();

  getDonationsList() async {
    dio.Response<dynamic> response =
        await getDonationsListAPIServices.getDonationsList();

    if (response.statusCode == 200) {
      DonationsListModel donationsListModel =
          DonationsListModel.fromJson(response.data);
      donationsList = donationsListModel.donate!.data;
      update();
    }
  }

  donateNow(DonationModel donationModel) async {
    dio.Response<dynamic> response =
        await donateServicesApi.donateApi(donationModel);

    if (response.statusCode == 200) {
      Get.snackbar(
        "Donated",
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
      Get.off(() => DonationsView());
    }
  }

  getSupporters(String id) async {
    dio.Response<dynamic> response =
        await getSupportersServicesApi.getSupporters(id);

    if (response.statusCode == 200) {
      SupportersLIstModel supportersLIstModel =
          SupportersLIstModel.fromJson(response.data);
      supportersList = supportersLIstModel.donor;
      update();
    }
  }
}
