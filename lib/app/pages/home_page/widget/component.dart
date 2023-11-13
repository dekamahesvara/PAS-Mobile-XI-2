import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_view.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

  Widget textHeading(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Text(text, style: heading),
    );
  }

  Widget textblack(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      child: Text(text, style: textBlack500),
    );
  }

  Widget textgray(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Text(text, style: textGray500),
    );
  }

  Widget buildCategoryButton(
      String categoryName, Color colorbutton, Color colortext) {
    HomePageController controller = Get.find<HomePageController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          controller.selectCategory(categoryName);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              categoryName == controller.selectedCategory.value ? primary : box,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: categoryName == controller.selectedCategory.value
                  ? colorbutton
                  : textGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductCard() {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(
              image: 'assets/image_sample.png',
              name: 'Product Name',
              price: '\$100.00',
            ));
      },
      child: Container(
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
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage('assets/image_sample.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$100.00',
                    style: TextStyle(fontSize: 12, color: textGray),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }