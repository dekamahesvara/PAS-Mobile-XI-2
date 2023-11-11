import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome Back!",
          style: heading,
        ),
        Text(
          "Sign In to access your account.",
          style: textGray500,
        ),
      ],
    );
  }
}
