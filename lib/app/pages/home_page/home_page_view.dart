import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/build_product_card.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

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
              child: const TextField(
                decoration: InputDecoration(
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
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              child: Obx(
                () => ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryButton("All", box, textWhite),
                    buildCategoryButton("Smartphones", box, textGray),
                    buildCategoryButton("Laptops", box, textGray),
                    buildCategoryButton("Fragrances", box, textGray),
                    buildCategoryButton("Groceries", box, textGray),
                  ],
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
