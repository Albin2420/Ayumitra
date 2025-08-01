import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedOption = 0.obs;

  void updateOption(int value) {
    selectedOption.value = value;
  }
}
