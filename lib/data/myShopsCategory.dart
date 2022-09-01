// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ShopCategoryModel shopCategoryModelFromJson(String str) =>
    ShopCategoryModel.fromJson(json.decode(str));

class ShopCategoryModel {
  ShopCategoryModel({
    required this.mainCategoryName,
    required this.count,
    required this.shops,
    required this.status,
  });

  String mainCategoryName;
  int count;
  List<Shop> shops;
  String status;

  factory ShopCategoryModel.fromJson(Map<String, dynamic> json) =>
      ShopCategoryModel(
        mainCategoryName: json["MainCategoryName"],
        count: json["count"],
        shops: List<Shop>.from(json["Shops"].map((x) => Shop.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "MainCategoryName": mainCategoryName,
        "count": count,
        "Shops": List<dynamic>.from(shops.map((x) => x.toJson())),
        "Status": status,
      };
}

class Shop {
  Shop(
      {required this.id,
      required this.mainCatId,
      required this.name,
      required this.img,
      required this.lat,
      required this.log,
      required this.createdAt,
      required this.updatedAt,
      required this.IsClosed});

  int id;
  int mainCatId;
  String name;
  String img;
  String lat;
  String log;
  dynamic createdAt;
  dynamic updatedAt;
  int IsClosed;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        mainCatId: json["MainCat_id"],
        name: json["name"],
        img: json["img"],
        lat: json["lat"],
        log: json["log"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        IsClosed: json["IsClosed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "MainCat_id": mainCatId,
        "name": name,
        "img": img,
        "lat": lat,
        "log": log,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "IsClosed": IsClosed
      };
}
