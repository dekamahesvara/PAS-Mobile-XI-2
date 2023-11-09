import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/btn_forget_pass.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/icon_app.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_button.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_field.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/widget/text_title.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:get/get.dart';

class SignInPageView extends GetView<SignInPageController> {
  const SignInPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    void toggleTextVisibility() {
      controller.isObsecure.value = !controller.isObsecure.value;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: gradientBackground(width, height, toggleTextVisibility),
      ),
    );
  }

  Container gradientBackground(
      double width, double height, void Function() toggleTextVisibility) {
    return Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconApp(width: width, height: height),
            const SizedBox(
              height: 20,
            ),
            whiteContainer(toggleTextVisibility),
            const SizedBox(
              height: 15,
            ),
            signInButton(),
          ],
        ),
      ),
    );
  }

  Container whiteContainer(void Function() toggleTextVisibility) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 500),
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
            height: 50,
          ),
          Column(
            children: [
              TextFieldSignin(
                  text: "Username", controller: controller.usernameController),
              const SizedBox(height: 20),
              textFieldObx(toggleTextVisibility),
              const SizedBox(height: 20),
              const BtnForgetPass(),
              const SizedBox(height: 100),
              const TextButtonSignUp(),
            ],
          ),
        ],
      ),
    );
  }

  Obx textFieldObx(void Function() toggleTextVisibility) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller.passwordController,
          obscureText: controller.isObsecure.value,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                controller.isObsecure.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: textBlack,
              ),
              onPressed: () {
                toggleTextVisibility();
              },
            ),
            labelText: 'Password',
            filled: true,
            fillColor: Colors.transparent,
            alignLabelWithHint: true,
            labelStyle: const TextStyle(color: gray),
            floatingLabelStyle: const TextStyle(color: black),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: gray),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: black),
            ),
          ),
        ),
      );
    });
  }

  Container signInButton() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed('/home');
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
