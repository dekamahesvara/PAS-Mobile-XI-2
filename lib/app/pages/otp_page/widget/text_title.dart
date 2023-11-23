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
          "OTP Verification",
          style: heading,
        ),
        Text(
          "Type in the OTP we gave to your email.",
          style: textGray500,
        ),
      ],
    );
  }
}
