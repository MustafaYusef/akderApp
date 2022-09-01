// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StockItemModel stockItemModelFromJson(String str) =>
    StockItemModel.fromJson(json.decode(str));

class StockItemModel {
  StockItemModel({
    required this.items,
  });

  List<ItemStock> items;

  factory StockItemModel.fromJson(Map<String, dynamic> json) => StockItemModel(
        items: List<ItemStock>.from(
            json["Items"].map((x) => ItemStock.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ItemStock {
  ItemStock({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.catId,
    required this.isActive,
    required this.catName,
  });

  int id;
  String name;
  String description;
  int price;
  String imagePath;
  int catId;
  int isActive;
  String catName;

  factory ItemStock.fromJson(Map<String, dynamic> json) => ItemStock(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        imagePath: json["image_path"],
        catId: json["cat_id"],
        isActive: json["IsActive"],
        catName: json["catName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image_path": imagePath,
        "cat_id": catId,
        "IsActive": isActive,
        "catName": catName,
      };
}
