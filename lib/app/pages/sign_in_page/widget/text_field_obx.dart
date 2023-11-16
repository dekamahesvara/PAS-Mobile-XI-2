import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/pages/sign_in_page/sign_in_controller.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:get/get.dart';

class TextFieldObx extends GetView<SignInPageController> {
  const TextFieldObx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() => TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'You need to fill this field';
                }

                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }

                if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                    .hasMatch(value)) {
                  return 'Password requires lowercase, uppercase, and a number';
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: red),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: red),
                ),
              ),
            )));
  }
}
