import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPageController>(
      () => DetailPageController(),
    );
    Get.lazyPut<CartPageController>(
      () => CartPageController(),
    );
    Get.lazyPut<WishlistPageController>(
      () => WishlistPageController(),
    );
  }
}
