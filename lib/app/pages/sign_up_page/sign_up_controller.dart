import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpPageController extends GetxController {
  var isObsecure = true.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
