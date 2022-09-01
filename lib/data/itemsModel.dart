// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemsModel itemsModelFromJson(String str) =>
    ItemsModel.fromJson(json.decode(str));

class ItemsModel {
  ItemsModel({
    required this.count,
    required this.items,
    required this.status,
  });

  int count;
  List<Item> items;
  String status;

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        count: json["count"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "Status": status,
      };
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.catId,
    required this.price,
    required this.imagePath,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String description;
  int catId;
  int price;
  String imagePath;
  int storeId;
  var createdAt;
  var updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        catId: json["cat_id"],
        price: json["price"],
        imagePath: json["image_path"],
        storeId: json["store_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "cat_id": catId,
        "price": price,
        "image_path": imagePath,
        "store_id": storeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
