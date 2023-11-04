import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartPageController>(() => CartPageController());
  }
}
