import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas_mobile_xi_2/app/models/cart_item_model.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/modal_controller.dart';

class CartPageController extends GetxController {
  final ModalController modalController = Get.put(ModalController());

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxInt totalCartPrice = 0.obs;
  RxString selectedPaymentMethodName = "GoPay".obs;
  RxString selectedPaymentMethodImage = "assets/payment/gopay.png".obs;

  final box = GetStorage();

  @override
  void onInit() {
    if (box.hasData('cartItems')) {
      final storedItems = box.read<List>('cartItems');
      cartItems
          .assignAll(storedItems!.map((item) => CartItemModel.fromJson(item)));
      updateTotalCartPrice();
    }
    super.onInit();
  }

  void addEvent(CartItemModel cartItemModel) {
    var existingItem = cartItems.firstWhere(
      (item) => item.productName == cartItemModel.productName,
      orElse: () => CartItemModel(
        productName: cartItemModel.productName,
        productImage: cartItemModel.productImage,
        productPrice: cartItemModel.productPrice,
        quantity: RxInt(cartItemModel.quantity.value),
      ),
    );

    if (cartItems.contains(existingItem)) {
      existingItem.quantity += cartItemModel.quantity.value;
      updateQuantityInStorage(existingItem);
    } else {
      cartItems.add(cartItemModel);
    }

    updateTotalCartPrice();
    saveCartItems();
  }

  void updateQuantityInStorage(CartItemModel item) {
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
    totalCartPrice.value = calculateTotalCartPrice() as int;
    update();
  }

  void saveCartItems() {
    box.write('cartItems', cartItems.map((item) => item.toJson()).toList());
  }

  void updatePaymentMethodName(String method) {
    selectedPaymentMethodName.value = method;
  }

  void updatePaymentMethodImage(String method) {
    selectedPaymentMethodName.value = method;
  }
}
