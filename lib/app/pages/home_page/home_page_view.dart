import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
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
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            Container(child: textblack("Categories")),
            SizedBox(
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
              margin: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: height * 0.35),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return buildProductCard();
                },
              ),
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
