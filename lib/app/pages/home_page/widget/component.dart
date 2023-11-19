import 'package:flutter/material.dart';
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
  return Text(text, style: textBlack500);
}

Widget textgray(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Text(text, style: textGray500),
  );
}

Widget buildCategoryButton(String categoryName, Color colorbutton,
    Color colortext, Null Function(dynamic categoryName) param3) {
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
