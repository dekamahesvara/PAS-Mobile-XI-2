import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  late final SharedPreferences prefs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
  }

  void clearToken() async {
    prefs.clear();
    Get.offAllNamed('/getstarted');
  }
}
