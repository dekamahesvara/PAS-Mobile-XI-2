import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:email_validator/email_validator.dart';

class TextFieldSignin extends StatelessWidget {
  const TextFieldSignin({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'You need to fill this field';
          }
          if (text == 'Email') {
            if (!EmailValidator.validate(value)) {
              return 'Please enter a valid email address';
            }
          }

          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: red),
          ),
        ),
      ),
    );
  }
}
