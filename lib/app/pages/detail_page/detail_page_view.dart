import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const DetailPage(
      {required this.image, required this.name, required this.price, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.asset(image,
                width: width, height: height * 0.4, fit: BoxFit.fitHeight)
          ]),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 18, color: textGray),
            ),
          ),
          // Add more details or actions as needed
        ],
      ),
    );
  }
}
