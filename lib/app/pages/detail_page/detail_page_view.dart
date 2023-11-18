import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/models/item_model.dart';
import 'package:pas_mobile_xi_2/app/pages/cart_page/cart_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/description.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/image_slideshow.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/main_image.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/product_price.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/product_title.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/rating_and_stock.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailPageController> {
  DetailPage({Key? key}) : super(key: key);
  final DetailPageController homePageController =
      Get.put(DetailPageController());
  final CartPageController cartPageController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.data.value.images.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainImage(controller: controller),
                    ProductTitle(controller: controller),
                    ProductPrice(controller: controller),
                    ImageSlideShow(controller: controller),
                    Description(controller: controller),
                    RatingAndStocks(controller: controller),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton:
                  Row(children: [addToCartButton(), addToWishlistButton()]));
    });
  }

  Container addToWishlistButton() {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 5),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: CircleAvatar(
        backgroundColor: primary,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: white,
          ),
        ),
      ),
    );
  }

  Expanded addToCartButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          onPressed: () {
            cartPageController.addEvent(ItemModel(
              productName: controller.data.value.title,
              productImage: controller.data.value.thumbnail,
              productPrice:
                  double.parse(controller.data.value.price.toString()),
            ));
            cartPageController.calculateTotalCartPrice();
            Get.toNamed('/cart');
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
              "Add To Cart",
              style: textWhite500,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
