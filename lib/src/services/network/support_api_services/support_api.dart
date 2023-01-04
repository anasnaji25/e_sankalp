import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_sankalp/src/const/auth_helpers.dart';
import 'package:e_sankalp/src/models/add_family_member_api.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/models/support_model.dart';
import 'package:e_sankalp/src/services/base_urls/base_url_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportServicesApi extends BaseApiService {
  Future support(SupportModel supportModel) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString(authToken);
      var response = await dio.post(supportURL,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $authtoken',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: {
            "name": supportModel.name,
            "email": supportModel.email,
            "message": supportModel.message
          });
      print("::::::::<Support>::::::::status code::::::::::::::");
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
