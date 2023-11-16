import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/button_back.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/icon_app.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/text_field.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/text_field_obx.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/text_title.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/text_button.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  SignUpPageView({super.key});
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      signUpButton(context, formKey),
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
              TextFieldSignUp(text: "Username", controller: usernameController),
              const SizedBox(height: 10),
              TextFieldSignUp(text: "Email", controller: emailController),
              const SizedBox(height: 10),
              TextFieldObx(passwordController: passwordController),
              const SizedBox(height: 40),
              const textButton(),
            ],
          ),
        ],
      ),
    );
  }

  Container signUpButton(BuildContext context, GlobalKey<FormState> formKey) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.emailVerify(context, usernameController.text,
                  emailController.text, passwordController.text);
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
              child: Text("Sign Up",
                  style: textPurple500, textAlign: TextAlign.center))),
    );
  }
}
