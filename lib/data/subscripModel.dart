// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SupscripModel supscripModelFromJson(String str) =>
    SupscripModel.fromJson(json.decode(str));

class SupscripModel {
  SupscripModel({
    required this.subscription,
  });

  List<Subscription> subscription;

  factory SupscripModel.fromJson(Map<String, dynamic> json) => SupscripModel(
        subscription: List<Subscription>.from(
            json["Subscription"].map((x) => Subscription.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Subscription": List<dynamic>.from(subscription.map((x) => x.toJson())),
      };
}

class Subscription {
  Subscription({
    required this.id,
    required this.name,
    required this.cost,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int cost;
  String createdAt;
  String updatedAt;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
