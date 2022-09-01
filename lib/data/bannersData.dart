// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannersModel bannersModelFromJson(String str) =>
    BannersModel.fromJson(json.decode(str));

class BannersModel {
  BannersModel({
    required this.count,
    required this.promotionImages,
    required this.status,
  });

  int count;
  List<PromotionImage> promotionImages;
  String status;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        count: json["count"],
        promotionImages: List<PromotionImage>.from(
            json["PromotionImages"].map((x) => PromotionImage.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "PromotionImages":
            List<dynamic>.from(promotionImages.map((x) => x.toJson())),
        "Status": status,
      };
}

class PromotionImage {
  PromotionImage({
    required this.image,
    required this.id,
  });

  String image;
  int id;

  factory PromotionImage.fromJson(Map<String, dynamic> json) => PromotionImage(
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
      };
}
