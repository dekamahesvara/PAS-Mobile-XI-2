import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class textHeading extends StatelessWidget {
  const textHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 10),
      child: Column(
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
      ),
    );
  }
}
