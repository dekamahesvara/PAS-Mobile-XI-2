import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class CartItemContainer extends GetView<CartPageController> {
  const CartItemContainer({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.index,
  });

  final String name, image;
  final int price, index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: textBlack500,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              Text('\$${price..toString()}', style: textGray400),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (controller.cartItems[index].quantity > 1) {
                        controller.cartItems[index].quantity--;
                        controller.updateTotalCartPrice();
                        controller.saveCartItems();
                        print(controller.cartItems[index].quantity.toString());
                      } else {
                        controller.removeItemFromCart(index);
                      }
                    },
                  ),
                  Obx(() =>
                      Text(controller.cartItems[index].quantity.toString())),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      controller.cartItems[index].quantity++;
                      controller.updateTotalCartPrice();
                      controller.saveCartItems();
                      print(controller.cartItems[index].quantity.toString());
                    },
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.removeItemFromCart(index);
            },
          ),
        ],
      ),
    );
  }
}
