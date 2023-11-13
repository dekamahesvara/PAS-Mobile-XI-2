import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/btn_forget_pass.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_button.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_field.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_title.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/button_back.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_field_obx.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/icon_app.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class SignInPageView extends GetView<SignInPageController> {
  SignInPageView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
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
                      iconApp(width: width, height: height),
                      const SizedBox(
                        height: 15,
                      ),
                      whiteContainer(),
                      const SizedBox(
                        height: 15,
                      ),
                      signInButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const ButtonBack(),
        ],
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
          Column(
            children: [
              TextFieldSignin(
                  text: "Username", controller: controller.usernameController),
              const SizedBox(height: 20),
              const TextFieldObx(),
              const BtnForgetPass(),
              const SizedBox(height: 50),
              const TextButtonSignUp(),
            ],
          ),
        ],
      ),
    );
  }

  Container signInButton() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.offAllNamed('/home');
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
              child: Text("Sign In",
                  style: textPurple500, textAlign: TextAlign.center))),
    );
  }
}
