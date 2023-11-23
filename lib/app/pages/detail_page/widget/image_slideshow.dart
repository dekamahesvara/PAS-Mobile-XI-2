import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class ImageSlideShow extends StatelessWidget {
  const ImageSlideShow({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(6),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.data.value.images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                controller.data.value.images[index],
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
