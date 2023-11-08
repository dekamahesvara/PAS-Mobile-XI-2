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
            "Welcome Back!",
            style: heading,
          ),
          Text(
            "Sign In to access your account.",
            style: textGray500,
          ),
        ],
      ),
    );
  }
}
