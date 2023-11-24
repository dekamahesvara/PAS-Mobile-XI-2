import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/models/wishlist_item_model.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/modal.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/description.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/main_image.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/product_price.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/product_title.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/rating_and_stock.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailPageController> {
  DetailPage({Key? key}) : super(key: key);
  final WishlistPageController wishlistPageController =
      Get.put(WishlistPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.load.value
          ? Scaffold(
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
              floatingActionButton: Row(children: [
                addToCartButton(context),
                addToWishlistButton(context)
              ]))
          : const Center(child: CircularProgressIndicator());
    });
  }

  Container addToWishlistButton(context) {
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
          onPressed: () {
            wishlistPageController.addEvent(WishlistItemModel(
              productName: controller.data.value.title,
              productImage: controller.data.value.thumbnail,
              productPrice:
                  double.parse(controller.data.value.price.toString()),
              productRating:
                  double.parse(controller.data.value.rating.toString()),
            ));
            controller.checkLiked();
            wishlistPageController.saveWishlistItems();
          },
          icon: Obx(() {
            return Icon(
              Icons.favorite,
              color: controller.liked.value ? red : white,
            );
          }),
        ),
      ),
    );
  }

  Expanded addToCartButton(context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: white,
              context: context,
              builder: (BuildContext context) {
                return ShowModalComponent(
                  context: context,
                );
              },
            );
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
