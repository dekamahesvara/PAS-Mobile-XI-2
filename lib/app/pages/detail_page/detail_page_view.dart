import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailPageController> {
  DetailPage({super.key});
  final DetailPageController homePageController =
      Get.put(DetailPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.data.value.title.isEmpty
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
                    Center(
                      child: Image.network(
                        controller.data.value.thumbnail,
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            controller.data.value.title.length > 30
                                ? '${controller.data.value.title.substring(0, 30)}...'
                                : controller.data.value.title,
                            style: textBlack600,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "\$${controller.data.value.price.toString()}.00",
                            style: textBlack500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      padding: const EdgeInsets.all(6),
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.data.value.images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                controller.data.value.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: textBlack600,
                          ),
                          Text(controller.data.value.description),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating:
                                controller.data.value.rating.toDouble(),
                            itemCount: 1,
                            itemSize: 30,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.5),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: star,
                            ),
                            onRatingUpdate: (double value) {},
                            ignoreGestures: true,
                          ),
                          Text(
                            "${controller.data.value.rating.toString()} | ${controller.data.value.stock.toString()} stock ",
                            style: textBlack400,
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      addToCartButton(),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 15, bottom: 15, left: 15),
                        height: 60,
                        width: 60,
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
                      )
                    ])
                  ],
                ),
              ),
            );
    });
  }

  Expanded addToCartButton() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
            onPressed: () {
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
                child: Text("Add To Cart",
                    style: textWhite500, textAlign: TextAlign.center))),
      ),
    );
  }
}
