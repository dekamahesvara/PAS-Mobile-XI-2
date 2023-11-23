import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpPageController extends GetxController {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  late Timer timer;
  RxInt secondsRemaining = 30.obs;
  RxBool enableResend = false.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 1) {
        secondsRemaining--;
      } else {
        enableResend.value = true;
      }
    });
  }

  void restartTimer() {
    secondsRemaining.value = 30;
    startTimer();
  }
}
