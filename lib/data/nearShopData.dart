// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

NearShopModel nearShopModelFromJson(String str) =>
    NearShopModel.fromJson(json.decode(str));

class NearShopModel {
  NearShopModel({
    required this.nearShop,
    required this.count,
  });

  List<Shop> nearShop;
  int count;

  factory NearShopModel.fromJson(Map<String, dynamic> json) => NearShopModel(
        nearShop:
            List<Shop>.from(json["NearShop"].map((x) => Shop.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "NearShop": List<dynamic>.from(nearShop.map((x) => x.toJson())),
        "count": count,
      };
}

// class NearShop {
//   NearShop({
//     required this.id,
//     required this.mainCatId,
//     required this.name,
//     required this.img,
//     required this.lat,
//     required this.log,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   int mainCatId;
//   String name;
//   String img;
//   String lat;
//   String log;
//   dynamic createdAt;
//   dynamic updatedAt;

//   factory NearShop.fromJson(Map<String, dynamic> json) => NearShop(
//         id: json["id"],
//         mainCatId: json["MainCat_id"],
//         name: json["name"],
//         img: json["img"],
//         lat: json["lat"],
//         log: json["log"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "MainCat_id": mainCatId,
//         "name": name,
//         "img": img,
//         "lat": lat,
//         "log": log,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
