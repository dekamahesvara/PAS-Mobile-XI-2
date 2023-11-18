import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/widget/cart_item_container.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Cart',
            style: textBlack600,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemContainer(
                        image: controller.cartItems[index].productImage,
                        name: controller.cartItems[index].productName,
                        price: controller.cartItems[index].productPrice.toInt(),
                        index: index,
                      );
                    },
                  );
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Payment Method",
                        style: textBlack600,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.payment,
                          color: Colors.black,
                          size: 40,
                        ),
                        const SizedBox(width: 15),
                        Text("Gopay", style: textBlack500),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Info",
                        style: textBlack600,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: textGray500,
                          ),
                          const Spacer(),
                          Obx(() {
                            if (controller.cartItems.isNotEmpty) {
                              return Text(
                                '\$${controller.totalCartPrice.value.toString()}',
                                style: textBlack500,
                              );
                            } else {
                              return Text(
                                '\$0',
                                style: textBlack500,
                              );
                            }
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(children: [checkOutButton(controller)]));
  }
}

Expanded checkOutButton(controller) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(left: 15, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: () {
          for (var item in controller.cartItems) {
            print(item.toJson());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "CheckOut",
            style: textWhite500,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
