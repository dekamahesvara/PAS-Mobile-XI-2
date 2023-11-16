import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class BtnForgetPass extends StatelessWidget {
  const BtnForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forget Password?",
          style: textRed500,
        ),
      ),
    );
  }
}
