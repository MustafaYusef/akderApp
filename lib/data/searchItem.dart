// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchItemModel searchItemModelFromJson(String str) =>
    SearchItemModel.fromJson(json.decode(str));

class SearchItemModel {
  SearchItemModel({
    required this.result,
    required this.count,
    required this.status,
  });

  List<Result> result;
  int count;
  String status;

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      SearchItemModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        count: json["count"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "count": count,
        "Status": status,
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.description,
    required this.catId,
    required this.price,
    required this.imagePath,
    required this.storeId,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int id;
  String name;
  String description;
  int catId;
  int price;
  String imagePath;
  int storeId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
