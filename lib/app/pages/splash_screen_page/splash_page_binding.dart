import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/splash_screen_page/splash_page_controller.dart';

class SplashScreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenPageController>(() => SplashScreenPageController());
  }
}
