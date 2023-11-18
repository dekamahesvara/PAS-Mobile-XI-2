import 'package:get/get.dart';

class CartItemModel {
  String productName;
  String productImage;
  double productPrice;
  RxInt quantity;

  CartItemModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    RxInt? quantity,
  }) : quantity = quantity ?? 1.obs;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: (json['productPrice'] as num).toDouble(),
      quantity: RxInt(json['quantity'] ?? 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'quantity': quantity.value,
    };
  }
}
