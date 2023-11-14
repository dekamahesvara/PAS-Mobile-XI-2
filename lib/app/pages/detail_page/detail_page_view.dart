import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/button_back.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  final List<String> variantImages = [
    'assets/image_sample.png',
    'assets/image_sample.png',
    'assets/image_sample.png',
    'assets/image_sample.png',
    'assets/image_sample.png',
    'assets/image_sample.png',

    // Add more variant images as needed
  ];

  DetailPage(
      {required this.image, required this.name, required this.price, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.asset(image,
                  width: width, height: height * 0.5, fit: BoxFit.contain),
              const ButtonBack()
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    name,
                    style: textBlack600,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    price,
                    style: textBlack600,
                  ),
                ),
              ],
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 100, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: variantImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        variantImages[index],
                        width: 80,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: textBlack600,
                  ),
                  const Text(
                      "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                    ignoreGestures: true,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.5",
                    style: textBlack500,
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: width * 0.15,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: white,
                        )),
                  )
                ],
              ),
            ),
            AddToCartButton()
          ],
        ),
      ),
    );
  }

  Container AddToCartButton() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/cart');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text("Add To Cart",
                  style: textWhite500, textAlign: TextAlign.center))),
    );
  }
}
