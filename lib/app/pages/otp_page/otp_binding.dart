import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/otp_page/otp_controller.dart';

class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpPageController>(() => OtpPageController());
  }
}
