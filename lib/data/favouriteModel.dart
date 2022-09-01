// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyFavouriteModel myFavouriteModelToJson(String str) =>
    MyFavouriteModel.fromJson(json.decode(str));

class MyFavouriteModel {
  MyFavouriteModel({
    required this.myFavor,
    required this.status,
  });

  List<MyFavor> myFavor;
  String status;

  factory MyFavouriteModel.fromJson(Map<String, dynamic> json) =>
      MyFavouriteModel(
        myFavor:
            List<MyFavor>.from(json["MyFavor"].map((x) => MyFavor.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "MyFavor": List<dynamic>.from(myFavor.map((x) => x.toJson())),
        "status": status,
      };
}

class MyFavor {
  MyFavor({
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

  factory MyFavor.fromJson(Map<String, dynamic> json) => MyFavor(
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
