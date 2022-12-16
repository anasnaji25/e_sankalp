import 'package:get/get.dart';

class TempleController extends GetxController {
  RxInt priestAmount = 5.obs;
  RxInt offeringAmount = 20.obs;
  RxInt totalAmount = 25.obs;

  RxInt pujaIndex = 0.obs;

  RxString timeString = "HH:SS:MM".obs;
  RxString timeSelected = "Morning".obs;
}
