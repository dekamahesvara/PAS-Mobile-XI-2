import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/btnSignUp.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/iconApp.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/textField.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/textHeading.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/widget/textButton.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({super.key});

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
        body: Container(
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
                iconApp(width: width, height: height),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const textHeading(),
                      Column(
                        children: [
                          textField(
                              text: "Username",
                              controller: controller.usernameController),
                          textField(
                              text: "Email",
                              controller: controller.emailController),
                          Obx(() {
                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 50),
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
                                  floatingLabelStyle:
                                      const TextStyle(color: black),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: gray),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: black),
                                  ),
                                ),
                              ),
                            );
                          }),
                          const textButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                btnSignUp(width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
