import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductCardHome extends StatelessWidget {
  BuildProductCardHome({super.key});
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homePageController.isLoading.value) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return homePageController.responseModel.value.products.isEmpty
            ? const Center(
                child: Text('No data available.'),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 300),
                  itemCount:
                      homePageController.responseModel.value.products.length,
                  itemBuilder: (context, index) {
                    final data =
                        homePageController.responseModel.value.products[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('detail', arguments: data.id.toString());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    data.thumbnail,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: textBlack500,
                                      ),
                                      Text(
                                        "\$${data.price.toString()}",
                                        style: textBlack600,
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: star,
                                ),
                                Text(
                                  data.rating.toString(),
                                  style: textBlack400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
      }
    });
  }
}
