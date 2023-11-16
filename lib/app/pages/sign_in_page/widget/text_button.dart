import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class TextButtonSignUp extends StatelessWidget {
  const TextButtonSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: textGray500,
        ),
        TextButton(
          onPressed: () {
            Get.offNamed('/signup');
          },
          child: Text(
            "Sign Up",
            style: textBlack500,
          ),
        )
      ],
    );
  }
}
