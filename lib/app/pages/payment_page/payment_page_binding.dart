import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/payment_page_controller.dart';

class PaymentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentPageController>(() => PaymentPageController());
  }
}
