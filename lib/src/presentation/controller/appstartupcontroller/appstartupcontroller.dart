import 'package:ayurmitra/src/presentation/screens/loginscreen/login.dart';
import 'package:get/get.dart';

class Appstartupcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 1));
    Get.offAll(() => Login());
  }
}
