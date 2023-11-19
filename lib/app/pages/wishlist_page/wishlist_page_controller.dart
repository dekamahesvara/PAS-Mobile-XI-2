import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas_mobile_xi_2/app/models/wishlist_item_model.dart';

class WishlistPageController extends GetxController {
  RxList<WishlistItemModel> wishlistItems = <WishlistItemModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadWishlistItems();
  }

  void loadWishlistItems() {
    if (box.hasData('wishlistItems')) {
      final storedItems = box.read<List>('wishlistItems');
      wishlistItems.assignAll(
          storedItems!.map((item) => WishlistItemModel.fromJson(item)));
    }
  }

  void addEvent(WishlistItemModel wishlistModel) {
    wishlistItems.add(wishlistModel);

    update();
    saveWishlistItems();
  }

  void removeItem(String productName) {
    var existingItemIndex = wishlistItems.indexWhere(
      (item) => item.productName == productName,
    );

    if (existingItemIndex != -1) {
      wishlistItems.removeAt(existingItemIndex);
      update();
      saveWishlistItems();
    }
  }

  void saveWishlistItems() {
    box.write(
        'wishlistItems', wishlistItems.map((item) => item.toJson()).toList());
  }
}
