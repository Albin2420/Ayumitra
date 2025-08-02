import 'package:ayurmitra/src/presentation/screens/loginscreen/login.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Appstartupcontroller extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(Duration(seconds: 1));
    Get.offAll(() => Login());
  }
}
