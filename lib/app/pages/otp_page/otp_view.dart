import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/otp_page/otp_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/otp_page/widget/icon_app.dart';
import 'package:pas_mobile_xi_2/app/pages/otp_page/widget/text_field.dart';
import 'package:pas_mobile_xi_2/app/pages/otp_page/widget/text_title.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class OtpPageView extends GetView<OtpPageController> {
  OtpPageView({super.key});
  final formKey = GlobalKey<FormState>();

  final SignUpPageController signUpPageController =
      Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                primary,
                secondary,
              ],
            ),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconApp(width: width, height: height),
                  const SizedBox(
                    height: 15,
                  ),
                  whiteContainer(),
                  const SizedBox(
                    height: 15,
                  ),
                  confirmButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container whiteContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const TextTitle(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldOtp(
                controller: controller.otpController1,
              ),
              TextFieldOtp(
                controller: controller.otpController2,
              ),
              TextFieldOtp(
                controller: controller.otpController3,
              ),
              TextFieldOtp(
                controller: controller.otpController4,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Container confirmButton(BuildContext context) {
    var otp =
        "${controller.otpController1.text}${controller.otpController2.text}${controller.otpController3.text}${controller.otpController4.text}";
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              signUpPageController.otpVerify(
                  context, otp, signUpPageController.email.value);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text("Confirm Code",
                  style: textPurple500, textAlign: TextAlign.center))),
    );
  }
}
