import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CarouselSlider.builder(
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        height: 500,
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      itemCount: controller.data.value.images.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Image.network(
        controller.data.value.images[index],
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
        fit: BoxFit.contain,
      ),
    ));
  }
}
