import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/data/payment_data.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/component/payment_selector.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var payment = PaymentData().payment;
    return Padding(
      padding: EdgeInsets.only(bottom: height / 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment", style: textBlack600,),
          const Divider(height: 2, color: box,),
          PaymentSelector(image: payment[0].image, name: payment[0].name, value: "0".obs),
          const Divider(height: 2, color: box,),
          PaymentSelector(image: payment[1].image, name: payment[1].name, value: "1".obs),
          const Divider(height: 2, color: box,),
          PaymentSelector(image: payment[2].image, name: payment[2].name, value: "2".obs),
          const Divider(height: 2, color: box,),

          const Divider(height: 2, color: box,),
          PaymentSelector(image: payment[3].image, name: payment[3].name, value: "3".obs),
          const Divider(height: 2, color: box,),
          PaymentSelector(image: payment[4].image, name: payment[4].name, value: "4".obs),
          const Divider(height: 2, color: box,),
        ],
      ),
    );
  }
}