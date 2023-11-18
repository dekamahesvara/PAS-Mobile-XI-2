import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  var isDarkModeEnabled = false.obs;

  void toggleDarkMode() {
    isDarkModeEnabled.toggle();
    // Add dark mode toggle functionality here
  }
}
