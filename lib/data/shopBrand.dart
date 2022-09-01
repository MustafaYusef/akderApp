// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShopBrandModel shopBrandModelFromJson(String str) =>
    ShopBrandModel.fromJson(json.decode(str));

class ShopBrandModel {
  ShopBrandModel({
    required this.count,
    required this.shopBrands,
    required this.status,
  });

  int count;
  List<ShopBrand> shopBrands;
  String status;

  factory ShopBrandModel.fromJson(Map<String, dynamic> json) => ShopBrandModel(
        count: json["count"],
        shopBrands: List<ShopBrand>.from(
            json["ShopBrands"].map((x) => ShopBrand.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "ShopBrands": List<dynamic>.from(shopBrands.map((x) => x.toJson())),
        "Status": status,
      };
}

class ShopBrand {
  ShopBrand({
    required this.id,
    required this.shopId,
    required this.img,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.cat_id,
  });

  int id;
  int shopId;
  String img;
  String name;
  dynamic createdAt;
  dynamic updatedAt;
  int cat_id;

  factory ShopBrand.fromJson(Map<String, dynamic> json) => ShopBrand(
        id: json["id"],
        shopId: json["shop_id"],
        img: json["img"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        cat_id: json["cat_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "img": img,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "cat_id": cat_id
      };
}
