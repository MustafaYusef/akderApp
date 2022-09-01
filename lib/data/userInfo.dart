// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

class UserInfoModel {
  UserInfoModel({
    required this.userName,
  });

  String userName;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
      };
}
