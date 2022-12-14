import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_sankalp/src/models/admin_register_model.dart';
import 'package:e_sankalp/src/models/register_model.dart';
import 'package:e_sankalp/src/services/base_urls/base_url_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminRegisterServicesApi extends BaseApiService {
  Future adminRegisterApi(
      AdminRegisterModel adminRegisterModel, String token) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      // final prefs = await SharedPreferences.getInstance();
      // String? authtoken = prefs.getString("auth_token");

      FormData formData = FormData.fromMap({
        "temple_name": adminRegisterModel.templeName,
        "deity_name": adminRegisterModel.deityName,
        "speciality_planet": adminRegisterModel.specialityPlanet,
        "hrnc": adminRegisterModel.hrnc,
        "organisation": adminRegisterModel.organisation,
        "incharge_person": adminRegisterModel.inChargePerson,
        "incharge_person_phone": adminRegisterModel.inchanrgePersonContanct,
        "poojari_name": adminRegisterModel.pooojariName,
        "poojari_phone": adminRegisterModel.poojariContactNumber,
        "poojari_acc_hol_name": adminRegisterModel.poojariBankName,
        "poojari_account_no": adminRegisterModel.poojariAccountNum,
        "poojari_ifsc": adminRegisterModel.poojariIfsc,
        "poojari_upi": adminRegisterModel.poojariUPI,
        "temple_acc_hol_name": adminRegisterModel.templeAccountName,
        "temple_acc_number": adminRegisterModel.templeAccountNumber,
        "temple_ifsc": adminRegisterModel.templeteIfsc,
        "temple_upi": adminRegisterModel.templeUPI,
        "temple_address": adminRegisterModel.templeAddress,
        "temple_phone": adminRegisterModel.templePhone,
        if (adminRegisterModel.archanaticketName1 != "null")
          "pooja_details[0][pooja_name]": adminRegisterModel.archanaticketName1,
        if (adminRegisterModel.archanaticketName1 != "null")
          "pooja_details[0][pooja_cost]": adminRegisterModel.archanaticket1,
        if (adminRegisterModel.archanaticketName2 != "null")
          "pooja_details[1][pooja_name]": adminRegisterModel.archanaticketName2,
        if (adminRegisterModel.archanaticketName2 != "null")
          "pooja_details[1][pooja_cost]": adminRegisterModel.archanaticket2,
        if (adminRegisterModel.archanaticketName3 != "null")
          "pooja_details[2][pooja_name]": adminRegisterModel.archanaticketName3,
        if (adminRegisterModel.archanaticketName3 != "null")
          "pooja_details[2][pooja_cost]": adminRegisterModel.archanaticket3,
        if (adminRegisterModel.archanaticketName4 != "null")
          "pooja_details[3][pooja_name]": adminRegisterModel.archanaticketName4,
        if (adminRegisterModel.archanaticketName4 != "null")
          "pooja_details[3][pooja_cost]": adminRegisterModel.archanaticket4,
        if (adminRegisterModel.archanaticketName5 != "null")
          "pooja_details[4][pooja_name]": adminRegisterModel.archanaticketName5,
        if (adminRegisterModel.archanaticketName5 != "null")
          "pooja_details[4][pooja_cost]": adminRegisterModel.archanaticket5,
        "archana_ticket_vehicle": adminRegisterModel.archanaTicketVehicle,
        "poojari_auth_image": await MultipartFile.fromFile(
            adminRegisterModel.poojariAuthImage.path,
            filename: adminRegisterModel.templeName),
      });

      var response = await dio.post(adminRegister,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }),
          data: formData);
      print("::::::::<Register>::::::::status code::::::::::");
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
