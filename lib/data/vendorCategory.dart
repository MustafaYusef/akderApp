// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VendorCatModel vendorCatModelFromJson(String str) =>
    VendorCatModel.fromJson(json.decode(str));

class VendorCatModel {
  VendorCatModel({
    required this.cats,
  });

  List<Cat> cats;

  factory VendorCatModel.fromJson(Map<String, dynamic> json) => VendorCatModel(
        cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cats": List<dynamic>.from(cats.map((x) => x.toJson())),
      };
}

class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.img,
  });

  int id;
  String name;
  String img;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
      };
}
