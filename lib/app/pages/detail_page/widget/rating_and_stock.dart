import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class RatingAndStocks extends StatelessWidget {
  const RatingAndStocks({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: star,
          ),
          Text(
            "${controller.data.value.rating.toString()} | ${controller.data.value.stock.toString()} items left in the stock ",
            style: textBlack500,
          ),
        ],
      ),
    );
  }
}
