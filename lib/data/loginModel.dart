// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel(
      {required this.token,
      required this.status,
      this.role,
      required this.isVerified});

  String token;
  String status;
  String? role;
  int isVerified;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      token: json["token"],
      status: json["Status"],
      role: json["RoleName"],
      isVerified: json["isVerified"]);

  Map<String, dynamic> toJson() => {
        "token": token,
        "Status": status,
        "RoleName": role,
        "isVerified": isVerified
      };
}
