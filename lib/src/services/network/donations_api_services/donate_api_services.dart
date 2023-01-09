import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/services/base_urls/base_url_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/donate_model.dart';

class DonateServicesApi extends BaseApiService {
  Future donateApi(DonationModel donationModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(registerUrl,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "donate_id": donationModel.id,
            "name": donationModel.name,
            "email": donationModel.emailId,
            "mobile": donationModel.phoneNumber,
            "address": donationModel.address,
            "state": donationModel.state,
            "country": donationModel.country,
            "pincode": donationModel.pincode,
            "is_anonyms": donationModel.isAnonyms,
            "amount": donationModel.amount
          });
      print("::::::::<Register>::::::::status code::::::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}
