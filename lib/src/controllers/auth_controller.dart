import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt langIndex = 0.obs;

  RxBool isAdmin = false.obs;

  RxBool isPoojariBankEnabled = false.obs;
  RxBool isTempleBankEnabled = false.obs;
  RxBool isTempleContactEnabled = false.obs;
  RxBool isArchanTicketEnabled = false.obs;
}
