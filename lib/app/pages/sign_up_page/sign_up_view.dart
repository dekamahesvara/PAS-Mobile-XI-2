import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:pas_mobile_xi_2/common/theme/text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                iconApp(width, height),
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
                      titleHeading(),
                      Column(
                        children: [
                          textField("Username", controller.usernameController),
                          textField("Email", controller.emailController),
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
                          textButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                btnSignUp(width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row textButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: textGray500,
        ),
        TextButton(
          onPressed: () {
            Get.offNamed('/signin');
          },
          child: Text(
            "Sign In",
            style: textBlack500,
          ),
        )
      ],
    );
  }

  Container textField(String text, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
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
  }

  Container titleHeading() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50, top: 10),
      child: Column(
        children: [
          Text(
            "Join Us Today!",
            style: heading,
          ),
          Text(
            "Sign Up to become a member.",
            style: textGray500,
          ),
        ],
      ),
    );
  }

  SizedBox btnSignUp(double width) {
    return SizedBox(
      width: width * 0.9,
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
              child: Text("Sign Up",
                  style: textPurple500, textAlign: TextAlign.center))),
    );
  }

  SvgPicture iconApp(double width, double height) {
    return SvgPicture.asset(
      'assets/svg/app_logo.svg',
      width: width * 0.05,
      height: height * 0.05,
    );
  }
}
