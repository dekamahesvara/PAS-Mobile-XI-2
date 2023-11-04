import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';

class WishlistPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistPageController>(() => WishlistPageController());
  }
}
