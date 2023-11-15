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
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    child: ElevatedButton(
      onPressed: () {
        controller.selectCategory(categoryName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            categoryName == controller.selectedCategory.value ? primary : box,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
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
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  //Network
                  'assets/image_sample.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: textBlack600,
              ),
              Text(
                '\$100.00',
                style: textBlack500,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
