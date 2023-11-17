import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/app/pages/payment_page/payment_page_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';

class PaymentSelector extends StatelessWidget {
  PaymentSelector(
      {super.key,
      required this.image,
      required this.name,
      required this.value});

  final PaymentPageController controller = Get.put(PaymentPageController());
  final String image, name;
  final RxString value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentPageController>(
      builder: (controller) {
        return InkWell(
          onTap: () => controller.setOrderType(value.value),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(name, style: textBlack600),
              ),
              const Spacer(),
              Radio(
                value: value.value,
                groupValue: controller.orderType.value,
                activeColor: primary,
                onChanged: (val) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
