import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/detail_page/detail_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.controller,
  });

  final DetailPageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        controller.data.value.title,
        style: textBlack600,
      ),
    );
  }
}
