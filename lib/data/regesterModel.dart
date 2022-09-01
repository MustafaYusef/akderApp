// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegesterModel regesterModelFromJson(String str) =>
    RegesterModel.fromJson(json.decode(str));

class RegesterModel {
  RegesterModel({
    required this.token,
    required this.status,
    required this.isVerified,
  });

  String token;
  String status;
  int isVerified;

  factory RegesterModel.fromJson(Map<String, dynamic> json) => RegesterModel(
        token: json["token"] == null ? null : json["token"],
        status: json["Status"] == null ? null : json["Status"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "Status": status == null ? null : status,
        "isVerified": isVerified == null ? null : isVerified,
      };
}
