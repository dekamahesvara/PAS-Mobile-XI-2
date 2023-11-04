import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';

class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
    );
  }
}
