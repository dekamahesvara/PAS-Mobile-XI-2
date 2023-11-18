import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/wishlist_page/wishlist_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class BuildProductCard extends GetView<WishlistPageController> {
  const BuildProductCard(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.rating});

  final String name, image;
  final int price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Center(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textBlack500,
                    ),
                    Text(
                      "\$${price.toString()}",
                      style: textBlack600,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: star,
                      ),
                      Text(
                        rating.toString(),
                        style: textBlack400,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: red,
                    ),
                    onPressed: () {
                      controller.removeItem(name);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
