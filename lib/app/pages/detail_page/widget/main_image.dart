import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        controller.data.value.thumbnail,
        height: 350,
        fit: BoxFit.contain,
      ),
    );
  }
}
