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
          "Join Us Today!",
          style: heading,
        ),
        Text(
          "Sign Up to become a member.",
          style: textGray500,
        ),
      ],
    );
  }
}
