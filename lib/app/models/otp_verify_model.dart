// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) =>
    OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
  String message;
  int status;
  String statusVerifikasi;

  OtpVerifyModel({
    required this.message,
    required this.status,
    required this.statusVerifikasi,
  });

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
        message: json["message"],
        status: json["status"],
        statusVerifikasi: json["status_verifikasi"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "status_verifikasi": statusVerifikasi,
      };
}
