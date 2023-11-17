import 'package:flutter/material.dart';

import 'package:pas_mobile_xi_2/app/pages/payment_page/component/payment_component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  PaymentComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
