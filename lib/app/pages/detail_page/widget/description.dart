import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: textBlack600,
          ),
          Text(
            controller.data.value.description,
            style: textGray500,
          ),
        ],
      ),
    );
  }
}
