import 'package:get/get.dart';

class PaymentPageController extends GetxController {
  final RxString _orderType = "0".obs;
  RxString get orderType => _orderType;
  void setOrderType(String type) {
    _orderType.value = type;
    print(_orderType);
    update();
  }
}
