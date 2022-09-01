// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

class ProfileModel {
  ProfileModel({
    required this.profileInfo,
  });

  ProfileInfo profileInfo;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        profileInfo: ProfileInfo.fromJson(json["ProfileInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "ProfileInfo": profileInfo.toJson(),
      };
}

class ProfileInfo {
  ProfileInfo({
    required this.userId,
    required this.name,
    required this.number,
    required this.subscriptionType,
  });

  int userId;
  String name;
  String number;
  String subscriptionType;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
        userId: json["userId"],
        name: json["name"],
        number: json["number"],
        subscriptionType: json["SubscriptionType"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "number": number,
        "SubscriptionType": subscriptionType,
      };
}
