import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/navbar_page/navbar_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';

class NavbarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarPageController>(() => NavbarPageController());
    Get.lazyPut<WishlistPageController>(() => WishlistPageController());
    Get.lazyPut<CartPageController>(() => CartPageController());
  }
}
