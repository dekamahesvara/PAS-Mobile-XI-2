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
  final SignInPageController signInPageController =
      Get.put(SignInPageController());

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
                      IconApp(width: width, height: height),
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
                  text: "Email", controller: controller.emailController),
              const SizedBox(height: 10),
              const TextFieldObx(),
              const SizedBox(height: 5),
              const BtnForgetPass(),
              const SizedBox(height: 40),
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
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              controller.loadData(controller.emailController.text,
                  controller.passwordController.text);
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
