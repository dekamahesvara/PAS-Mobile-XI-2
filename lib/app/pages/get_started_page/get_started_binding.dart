import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/get_started_page/get_started_controller.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(
      () => GetStartedController(),
    );
  }
}
