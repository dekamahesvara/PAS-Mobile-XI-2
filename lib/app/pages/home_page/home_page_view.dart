import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textHeading(
                    "Hello",
                  ),
                  textgray(
                    "Welcome to Thrivee",
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                onChanged: (searchQuery) {
                  controller.loadDataBySearch(searchQuery);
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: box,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15, left: 15, bottom: 10),
                child: textblack("Categories")),
            Obx(
              () => controller.responseModel.value.products.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.responseCategoryModel.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return buildCategoryButton(
                              "All",
                              box,
                              textGray,
                              (categoryName) {
                                controller.loadDataAll();
                              },
                            );
                          } else {
                            String categoryName = controller
                                .responseCategoryModel[index - 1]
                                .toString();
                            return buildCategoryButton(
                              categoryName,
                              box,
                              textGray,
                              (categoryName) {
                                if (categoryName != "All") {
                                  controller.loadDataByCategory(categoryName);
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
            ),
            Container(
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
                child: BuildProductCardHome()),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
