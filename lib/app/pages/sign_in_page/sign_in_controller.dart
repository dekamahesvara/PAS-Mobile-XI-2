import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInPageController extends GetxController {
  var isObsecure = true.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
