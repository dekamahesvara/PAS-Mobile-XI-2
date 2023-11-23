import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/payment_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class PaymentSelector extends StatelessWidget {
  PaymentSelector({
    Key? key,
    required this.image,
    required this.name,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final PaymentPageController controller = Get.find<PaymentPageController>();
  final String image, name;
  final RxString value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.setOrderType(value.value);
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: box,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                scale: 1.7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(name, style: textBlack600),
            ),
          ],
        ),
      ),
    );
  }
}
