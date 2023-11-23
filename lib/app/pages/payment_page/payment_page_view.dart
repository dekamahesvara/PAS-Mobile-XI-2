import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/component/payment_component.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Center(
          child: Text(
            'Payment',
            style: textBlack600,
          ),
        ),
      ),
      backgroundColor: white,
      body: const Padding(
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
