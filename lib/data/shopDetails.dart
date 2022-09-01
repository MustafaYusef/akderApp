// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShopDetailsModel shopDetailsModelFromJson(String str) =>
    ShopDetailsModel.fromJson(json.decode(str));

class ShopDetailsModel {
  ShopDetailsModel({
    this.shopName,
    this.shopOption,
    this.count,
    this.shopDetails,
    this.status,
  });

  String? shopName;
  ShopOption? shopOption;
  int? count;
  List<ShopDetail>? shopDetails;
  String? status;

  factory ShopDetailsModel.fromJson(Map<String, dynamic> json) =>
      ShopDetailsModel(
        shopName: json["shopName"],
        shopOption: ShopOption.fromJson(json["ShopOption"]),
        count: json["count"],
        shopDetails: List<ShopDetail>.from(
            json["ShopDetails"].map((x) => ShopDetail.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "shopName": shopName,
        "ShopOption": shopOption!.toJson(),
        "count": count,
        "ShopDetails": List<dynamic>.from(shopDetails!.map((x) => x.toJson())),
        "Status": status,
      };
}

class ShopDetail {
  ShopDetail({
    required this.id,
    required this.name,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String img;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ShopOption {
  ShopOption({
    required this.id,
    required this.shopId,
    required this.minReqAmount,
    required this.deliverFees,
    required this.deliverDuration,
    required this.createdAt,
    required this.updatedAt,
    required this.img,
  });

  int id;
  int shopId;
  int minReqAmount;
  int deliverFees;
  int deliverDuration;
  dynamic createdAt;
  dynamic updatedAt;
  String img;

  factory ShopOption.fromJson(Map<String, dynamic> json) => ShopOption(
        id: json["id"],
        shopId: json["shop_id"],
        minReqAmount: json["min_req_amount"],
        deliverFees: json["deliverFees"],
        deliverDuration: json["deliverDuration"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "min_req_amount": minReqAmount,
        "deliverFees": deliverFees,
        "deliverDuration": deliverDuration,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "img": img,
      };
}













// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// ShopDetailsModel shopDetailsModelFromJson(String str) =>
//     ShopDetailsModel.fromJson(json.decode(str));

// class ShopDetailsModel {
//   ShopDetailsModel({
//     this.shopName,
//     this.count,
//     this.shopDetails,
//     this.status,
//   });

//   String? shopName;
//   int? count;
//   List<ShopDetail>? shopDetails;
//   String? status;

//   factory ShopDetailsModel.fromJson(Map<String, dynamic> json) =>
//       ShopDetailsModel(
//         shopName: json["shopName"],
//         count: json["count"],
//         shopDetails: List<ShopDetail>.from(
//             json["ShopDetails"].map((x) => ShopDetail.fromJson(x))),
//         status: json["Status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "shopName": shopName,
//         "count": count,
//         "ShopDetails": List<dynamic>.from(shopDetails!.map((x) => x.toJson())),
//         "Status": status,
//       };
// }

// class ShopDetail {
//   ShopDetail({
//     required this.id,
//     required this.name,
//     required this.img,
//     // required this.createdAt,
//     // required this.updatedAt,
//   });

//   int id;
//   String name;
//   String img;
//   // DateTime createdAt;
//   // DateTime updatedAt;

//   factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
//         id: json["id"],
//         name: json["name"],
//         img: json["img"],
//         // createdAt: DateTime.parse(json["created_at"]),
//         // updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "img": img,
//         // "created_at": createdAt.toIso8601String(),
//         // "updated_at": updatedAt.toIso8601String(),
//       };
// }
