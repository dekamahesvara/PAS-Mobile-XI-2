import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      checkToken();
    });
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('token');

    if (prefs.getString('token') != null && prefs.getString('token') != "") {
      Get.offNamed("/navbar");
    } else {
      Get.offNamed("/getstarted");
    }
  }
}
