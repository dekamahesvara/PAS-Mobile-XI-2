import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:lottie/lottie.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        textHeading(
                          "Hello",
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Obx(() {
                            return Text(
                              controller.username.value,
                              style: textBlack600,
                            );
                          }),
                        ),
                      ],
                    ),
                    textgray(
                      "Welcome to Thrivee",
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                    margin:
                        const EdgeInsets.only(top: 15, left: 15, bottom: 10),
                    child: textblack("Categories")),
                Obx(
                  () {
                    return controller.successLoadAll.value
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemCount:
                                  controller.responseCategoryModel.length + 1,
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
                                    (categoryName) {},
                                  );
                                }
                              },
                            ),
                          )
                        : Container();
                  },
                ),
                Obx(() {
                  if (controller.successLoadAll.value == false) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.responseModel.value.products.isEmpty) {
                    return Center(
                      child: Column(children: [
                        Lottie.asset(
                          'assets/lottie/empty.json',
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "Oops, there is no product here.",
                          style: textBlack500,
                        ),
                      ]),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            child: const BuildProductCardHome()),
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
