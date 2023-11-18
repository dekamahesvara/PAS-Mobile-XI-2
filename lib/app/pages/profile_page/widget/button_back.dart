import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
