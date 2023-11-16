import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class textButton extends StatelessWidget {
  const textButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: textGray500,
        ),
        TextButton(
          onPressed: () {
            Get.offNamed('/signin');
          },
          child: Text(
            "Sign In",
            style: textBlack500,
          ),
        )
      ],
    );
  }
}
