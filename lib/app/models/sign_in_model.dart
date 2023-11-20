import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  String message;
  int status;
  String token;
  User user;

  SignInModel({
    required this.message,
    required this.status,
    required this.token,
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json["message"],
        status: json["status"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;
  String email;
  String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "username": username,
        "email": email,
        "password": password,
      };
}
