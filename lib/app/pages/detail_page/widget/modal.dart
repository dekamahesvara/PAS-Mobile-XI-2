import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/models/cart_item_model.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/modal_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class ShowModalComponent extends GetView<DetailPageController> {
  ShowModalComponent({super.key, required this.context});
  final BuildContext context;
  final CartPageController cartPageController = Get.put(CartPageController());
  final ModalController modalController = Get.put(ModalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount : ",
                  style: textBlack600,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (modalController.amount > 1) {
                          modalController.amount--;
                        }
                      },
                    ),
                    Obx(() => Text(modalController.amount.toString())),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        if (modalController.amount <
                            controller.data.value.stock) {
                          modalController.amount++;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton(
              onPressed: () {
                cartPageController.addEvent(
                  CartItemModel(
                    productName: controller.data.value.title,
                    productImage: controller.data.value.thumbnail,
                    productPrice:
                        double.parse(controller.data.value.price.toString()),
                    quantity: RxInt(modalController.amount.value),
                  ),
                );
                modalController.amount = 1.obs;
                cartPageController.updateTotalCartPrice();
                cartPageController.saveCartItems();
                Get.offNamed('cart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Text(
                  "Add To Cart",
                  style: textWhite500,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
