import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class CartItemContainer extends GetView<CartPageController> {
  const CartItemContainer(
      {super.key,
      required this.name,
      required this.image,
      required this.price});

  final String name, image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: textBlack600),
                Text('\$${price.toStringAsFixed(2)}', style: textGray400),
                Obx(() {
                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(controller.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  );
                })
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
