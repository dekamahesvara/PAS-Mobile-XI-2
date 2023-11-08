import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_xi_2/common/theme/color_theme.dart';

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
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
}
