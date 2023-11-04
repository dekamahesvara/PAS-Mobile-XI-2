import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_controller.dart';

class SignInPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPageController>(() => SignInPageController());
  }
}
