import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  late final SharedPreferences prefs;
  late String username = '';
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
    username = prefs.getString('username') ?? '';
  }

  void clearToken() async {
    prefs.clear();
    Get.offAllNamed('/getstarted');
  }
}
