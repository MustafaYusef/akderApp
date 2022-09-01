// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MainCategoryModel mainCategoryModelFromJson(String str) =>
    MainCategoryModel.fromJson(json.decode(str));

class MainCategoryModel {
  MainCategoryModel({
    required this.mainCategory,
    required this.status,
  });

  List<MainCategory> mainCategory;
  String status;

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) =>
      MainCategoryModel(
        mainCategory: List<MainCategory>.from(
            json["MainCategory"].map((x) => MainCategory.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "MainCategory": List<dynamic>.from(mainCategory.map((x) => x.toJson())),
        "Status": status,
      };
}

class MainCategory {
  MainCategory({
    required this.name,
    required this.img,
    required this.id,
  });

  String name;
  String img;
  int id;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        name: json["name"],
        img: json["img"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "id": id,
      };
}
