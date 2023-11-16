// ignore_for_file: use_build_context_synchronously

import 'package:pas_mobile_xi_2/app/models/email_verify_model.dart';
import 'package:pas_mobile_xi_2/app/models/otp_verify_model.dart';
import 'package:pas_mobile_xi_2/app/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignUpPageController extends GetxController {
  Rx<EmailVerifyModel> emailverify =
      EmailVerifyModel(message: "", status: 0).obs;

  Rx<OtpVerifyModel> otpverify =
      OtpVerifyModel(message: "", status: 0, statusVerifikasi: "").obs;

  Rx<RegisterModel> registermodel =
      RegisterModel(message: "", status: false).obs;

  emailVerify(BuildContext context, String username, String email,
      String password) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/email/verify'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({"email": email}));

      print(response.body);

      if (response.statusCode == 200) {
        emailverify.value = emailVerifyModelFromJson(response.body);

        if (emailverify.value.message ==
            "maaf, email yang anda masukan sudah terdaftar") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('The Email has already been registered')));
        } else {
          otpSend(context, email);
          this.email.value = email;
          this.username.value = username;
          this.password.value = password;
          Get.toNamed('/otp');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  otpSend(BuildContext context, String email) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/otp/generate'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({"email": email}));

      print(response.body);
      print("OTP SEND: $email");
    } catch (e) {
      print("error: $e");
    }
  }

  otpVerify(BuildContext context, String otp, String email) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/otp/verify'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({"email": email, "otp": otp}));

      print("OTP VERIFY: $email, $otp");

      if (response.statusCode == 200) {
        otpverify.value = otpVerifyModelFromJson(response.body);
        if (otpverify.value.status == 200) {
          register(context);
        }

        if (otpverify.value.status == 401) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Wrong OTP')));
        }

        if (otpverify.value.status == 419) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP has been expired')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Something Wrong')));
      }
    } catch (e) {
      print("error: $e");
    }
  }

  register(BuildContext context) async {
    try {
      String url =
          "https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/user/register";

      var response = await http.post(
        Uri.parse(url.toString()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username.value,
          'email': email.value,
          'password': password.value,
        }),
      );

      if (response.statusCode == 201) {
        registermodel.value = registerModelFromJson(response.body);
        if (registermodel.value.status == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Up Success')));
          Get.toNamed('/signin');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Up Failed')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Something Wrong')));
      }
    } catch (e) {
      print("error: $e");
    }
  }

  var isObsecure = true.obs;
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleTextVisibility() {
    isObsecure.value = !isObsecure.value;
  }
}
