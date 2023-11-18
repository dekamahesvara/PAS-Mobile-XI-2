import 'package:get/get.dart';

class CartPageController extends GetxController {
  RxInt quantity = 1.obs;
  RxString selectedPaymentMethodName = "GoPay".obs;
  RxString selectedPaymentMethodImage = "assets/payment/gopay.png".obs;

  void updatePaymentMethodName(String method) {
    selectedPaymentMethodName.value = method;
  }

  void updatePaymentMethodImage(String method) {
    selectedPaymentMethodName.value = method;
  }
}
