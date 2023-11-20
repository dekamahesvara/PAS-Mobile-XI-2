import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class WishlistPageView extends StatelessWidget {
  const WishlistPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistPageController controller = Get.put(WishlistPageController());
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Wishlist',
          style: textBlack600,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Obx(() {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: height * 0.35),
                  itemCount: controller.wishlistItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildProductCard(
                      image: controller.wishlistItems[index].productImage,
                      name: controller.wishlistItems[index].productName,
                      price:
                          controller.wishlistItems[index].productPrice.toInt(),
                      rating: controller.wishlistItems[index].productRating,
                    );
                  },
                );
              }),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
