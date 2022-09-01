// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShopSlider shopSliderFromJson(String str) =>
    ShopSlider.fromJson(json.decode(str));

class ShopSlider {
  ShopSlider({
    required this.count,
    required this.shopPromotions,
    required this.status,
  });

  int count;
  List<ShopPromotion> shopPromotions;
  String status;

  factory ShopSlider.fromJson(Map<String, dynamic> json) => ShopSlider(
        count: json["count"],
        shopPromotions: List<ShopPromotion>.from(
            json["ShopPromotions"].map((x) => ShopPromotion.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "ShopPromotions":
            List<dynamic>.from(shopPromotions.map((x) => x.toJson())),
        "Status": status,
      };
}

class ShopPromotion {
  ShopPromotion({
    required this.id,
    required this.shopId,
    required this.img,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int shopId;
  String img;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory ShopPromotion.fromJson(Map<String, dynamic> json) => ShopPromotion(
        id: json["id"],
        shopId: json["shop_id"],
        img: json["img"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "img": img,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
