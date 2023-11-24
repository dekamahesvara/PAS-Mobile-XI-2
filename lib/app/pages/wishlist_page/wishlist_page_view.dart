import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            if (controller.wishlistItems.isEmpty) {
              return Center(
                child: Column(children: [
                  Lottie.asset(
                    'assets/lottie/empty.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "Oops, you haven't added anything to wishlist yet..",
                    style: textBlack500,
                  ),
                ]),
              );
            } else {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          primary,
                          secondary,
                        ],
                      ),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: height * 0.35),
                      itemCount: controller.wishlistItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildProductCard(
                          image: controller.wishlistItems[index].productImage,
                          name: controller.wishlistItems[index].productName,
                          price: controller.wishlistItems[index].productPrice
                              .toInt(),
                          rating: controller.wishlistItems[index].productRating,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
