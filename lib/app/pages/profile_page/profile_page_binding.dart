import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/profile_page/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
