import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_up_page/sign_up_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class TextFieldObx extends GetView<SignUpPageController> {
  const TextFieldObx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() => TextField(
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
                    controller.toggleTextVisibility();
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
            )));
  }
}
