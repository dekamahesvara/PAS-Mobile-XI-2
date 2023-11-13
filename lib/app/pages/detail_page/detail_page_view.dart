import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/widget/button_back.dart';

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
              ButtonBack()
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
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    price,
                    style: textBlack600,
                  ),
                ),
              ],
            ),
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
                  Text(
                      "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
