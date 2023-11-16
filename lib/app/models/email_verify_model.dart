import 'dart:convert';

EmailVerifyModel emailVerifyModelFromJson(String str) =>
    EmailVerifyModel.fromJson(json.decode(str));

class EmailVerifyModel {
  String message;
  int status;

  EmailVerifyModel({
    required this.message,
    required this.status,
  });

  factory EmailVerifyModel.fromJson(Map<String, dynamic> json) =>
      EmailVerifyModel(
        message: json["message"],
        status: json["status"],
      );
}
