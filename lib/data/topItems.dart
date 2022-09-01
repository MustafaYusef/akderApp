// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:akhder_app/data/itemsModel.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

TopItemsMode topItemsModeFromJson(String str) =>
    TopItemsMode.fromJson(json.decode(str));

class TopItemsMode {
  TopItemsMode({
    required this.count,
    required this.itemsTopFive,
    required this.status,
  });

  int count;
  List<Item> itemsTopFive;
  String status;

  factory TopItemsMode.fromJson(Map<String, dynamic> json) => TopItemsMode(
        count: json["count"],
        itemsTopFive:
            List<Item>.from(json["ItemsTopFive"].map((x) => Item.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "ItemsTopFive": List<dynamic>.from(itemsTopFive.map((x) => x.toJson())),
        "Status": status,
      };
}

// class ItemsTopFive {
//   ItemsTopFive({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.catId,
//     required this.price,
//     required this.imagePath,
//     required this.storeId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String name;
//   String description;
//   int catId;
//   int price;
//   String imagePath;
//   int storeId;
//   dynamic createdAt;
//   dynamic updatedAt;

//   factory ItemsTopFive.fromJson(Map<String, dynamic> json) => ItemsTopFive(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         catId: json["cat_id"],
//         price: json["price"],
//         imagePath: json["image_path"],
//         storeId: json["store_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "cat_id": catId,
//         "price": price,
//         "image_path": imagePath,
//         "store_id": storeId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
