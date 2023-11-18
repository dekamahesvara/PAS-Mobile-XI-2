import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas_mobile_xi_2/app/models/item_model.dart';

class CartPageController extends GetxController {
  RxList<ItemModel> cartItems = <ItemModel>[].obs;
  RxDouble totalCartPrice = 0.0.obs;

  final box = GetStorage();

  @override
  void onInit() {
    if (box.hasData('cartItems')) {
      final storedItems = box.read<List>('cartItems');
      cartItems.assignAll(storedItems!.map((item) => ItemModel.fromJson(item)));
      updateTotalCartPrice();
    }
    super.onInit();
  }

  void addEvent(ItemModel cartItemModel) {
    var existingItem = cartItems.firstWhere(
      (item) => item.productName == cartItemModel.productName,
      orElse: () => ItemModel(
        productName: cartItemModel.productName,
        productImage: cartItemModel.productImage,
        productPrice: cartItemModel.productPrice,
      ),
    );

    if (cartItems.contains(existingItem)) {
      existingItem.quantity++;
      updateQuantityInStorage(existingItem);
    } else {
      cartItems.add(cartItemModel);
    }

    updateTotalCartPrice();
    saveCartItems();
  }

  void updateQuantityInStorage(ItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productName == item.productName);

    List<Map<String, dynamic>> storedItems =
        (box.read<List>('cartItems') ?? []).cast<Map<String, dynamic>>();
    storedItems[index]['quantity'] = item.quantity;
    box.write('cartItems', storedItems);
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    updateTotalCartPrice();
    saveCartItems();
  }

  double calculateTotalCartPrice() {
    return cartItems.fold(
        0.0, (total, item) => total + item.productPrice * item.quantity.value);
  }

  void updateTotalCartPrice() {
    totalCartPrice.value = calculateTotalCartPrice();
    update();
  }

  void saveCartItems() {
    box.write('cartItems', cartItems.map((item) => item.toJson()).toList());
  }
}
