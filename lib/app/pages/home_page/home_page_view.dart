import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/home_page/home_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: background,
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
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6),
                itemCount: 6, // Adjust the itemCount as per your requirement
                itemBuilder: (BuildContext context, int index) {
                  return buildProductCard(width * 0.4, height * 0.3);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget buildProductCard(double width, double height) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page with data using Get.to
        Get.to(() => const DetailPage(
              // Pass the image, name, and price to the detail page
              image: 'assets/image_sample.png',
              name: 'Product Name',
              price: '\$100.00',
            ));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: height,
                      maxWidth: width,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage('assets/image_sample.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ],
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
                  // Product Price
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
}
