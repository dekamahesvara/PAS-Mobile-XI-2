import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas_mobile_xi_2/app/models/sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPageController extends GetxController {
  Rx<SignInModel> loginModel = SignInModel(
    message: '',
    status: 0,
    token: '',
  ).obs;

  loadData(String email, String password) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/login'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({"email": "$email", "password": "$password"}));

      if (response.statusCode == 200) {
        loginModel.value = signInModelFromJson(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', loginModel.value.token);
        Get.offNamed("/home");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  var isObsecure = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleTextVisibility() {
    isObsecure.value = !isObsecure.value;
  }
}
