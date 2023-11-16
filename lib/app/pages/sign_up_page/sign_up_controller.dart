import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_xi_2/app/models/email_verify_model.dart';
import 'package:pas_mobile_xi_2/app/models/otp_verify_model.dart';
import 'package:pas_mobile_xi_2/app/models/register_model.dart';

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
          body: jsonEncode({"email": "$email"}));

      print(response.body);

      if (response.statusCode == 200) {
        this.username.value = username;

        emailverify.value = emailVerifyModelFromJson(response.body);

        if (emailverify.value.message ==
            "maaf, email yang anda masukan sudah terdaftar") {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email sudah terdaftar')));
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
          body: jsonEncode({"email": "$email"}));

      print(response.body);

      if (response.statusCode == 200) {}
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
          body: jsonEncode({"email": email, "otp": "$otp"}));

      print("$email, $otp");

      if (response.statusCode == 200) {
        otpverify.value = otpVerifyModelFromJson(response.body);
        if (otpverify.value.status == 200)
          register(context, this.email.value, this.username.value,
              this.password.value);

        if (otpverify.value.status == 401)
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Kode OTP salah')));

        if (otpverify.value.status == 419)
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Kode OTP telah kadaluarsa')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Terjadi kesalahan')));
      }
    } catch (e) {
      print("error: $e");
    }
  }

  register(BuildContext context, String email, String username,
      String password) async {
    try {
      String url =
          "https://jellyfish-app-wmftv.ondigitalocean.app/api/v1/user/register";

      var response = await http.post(
        Uri.parse(url.toString()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': this.username.value,
          'email': this.email.value,
          'password': this.password.value,
        }),
      );

      if (response.statusCode == 201) {
        registermodel.value = registerModelFromJson(response.body);
        if (registermodel.value.status == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registrasi berhasil')));
          Get.toNamed('/signin');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Registrasi gagal')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Terjadi kesalahan')));
      }
    } catch (e) {
      print("error: $e");
    }
  }

  var isObsecure = true.obs;
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;

  toggleTextVisibility() {
    isObsecure.value = !isObsecure.value;
  }
}
