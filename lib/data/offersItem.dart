// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OfferShopeItems offerShopeItemsFromJson(String str) =>
    OfferShopeItems.fromJson(json.decode(str));

class OfferShopeItems {
  OfferShopeItems({
    required this.shopOffers,
    required this.status,
  });

  List<ShopOffer> shopOffers;
  String status;

  factory OfferShopeItems.fromJson(Map<String, dynamic> json) =>
      OfferShopeItems(
        shopOffers: List<ShopOffer>.from(
            json["ShopOffers"].map((x) => ShopOffer.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "ShopOffers": List<dynamic>.from(shopOffers.map((x) => x.toJson())),
        "Status": status,
      };
}

class ShopOffer {
  ShopOffer({
    required this.name,
    required this.imagePath,
    required this.oldPrice,
    required this.ratio,
    required this.isActive,
    required this.newPrice,
  });

  String name;
  String imagePath;
  int oldPrice;
  double ratio;
  int isActive;
  int newPrice;

  factory ShopOffer.fromJson(Map<String, dynamic> json) => ShopOffer(
        name: json["name"],
        imagePath: json["image_path"],
        oldPrice: json["OldPrice"],
        ratio: json["ratio"].toDouble(),
        isActive: json["IsActive"],
        newPrice: json["NewPrice"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_path": imagePath,
        "OldPrice": oldPrice,
        "ratio": ratio,
        "IsActive": isActive,
        "NewPrice": newPrice,
      };
}
