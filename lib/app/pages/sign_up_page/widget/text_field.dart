import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';
import 'package:email_validator/email_validator.dart';

class TextFieldSignUp extends StatelessWidget {
  const TextFieldSignUp({
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
          if (text == 'Username') {
            if (value.length < 6) {
              return 'Username must be at least 6 characters';
            }
            if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
              return 'Username can only contain letters and numbers';
            }
          }

          if (text == 'Email') {
            if (!EmailValidator.validate(value)) {
              return 'Please enter a valid email address';
            }
          }

          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: text,
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
}
