import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

class SignInModel {
  String message;
  int status;
  String token;

  SignInModel({
    required this.message,
    required this.status,
    required this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json["message"],
        status: json["status"],
        token: json["token"],
      );
}
