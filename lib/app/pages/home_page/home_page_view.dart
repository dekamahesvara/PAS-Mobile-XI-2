import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/widget/component.dart';

import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 30, bottom: 20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: box,
                  ),
                  child: ClipOval(
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: width * 0.2,
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
              ],
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
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: height * 0.05,
              child: Obx(
                () => ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryButton("All", box, textWhite),
                    buildCategoryButton("Smartphone", box, textGray),
                    buildCategoryButton("Labtop", box, textGray),
                    buildCategoryButton("Skincare", box, textGray),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: height * 0.4),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return buildProductCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
