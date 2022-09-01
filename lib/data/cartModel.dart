// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

class CartModel {
  CartModel({
    required this.userBasket,
    required this.status,
  });

  List<UserBasket> userBasket;
  String status;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        userBasket: List<UserBasket>.from(
            json["UserBasket"].map((x) => UserBasket.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "UserBasket": List<dynamic>.from(userBasket.map((x) => x.toJson())),
        "status": status,
      };
}

class UserBasket {
  UserBasket({
    required this.id,
    required this.name,
    required this.price,
    required this.itemId,
    required this.itemImage,
    required this.count,
    required this.storeName,
    required this.storeImage,
    required this.deliverDuration,
    required this.deliverFees,
    required this.minReqAmount,
  });

  int id;
  String name;
  int price;
  int itemId;
  String itemImage;
  int count;
  String storeName;
  String storeImage;
  int deliverDuration;
  int deliverFees;
  int minReqAmount;

  factory UserBasket.fromJson(Map<String, dynamic> json) => UserBasket(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        itemId: json["item_id"],
        itemImage: json["ItemImage"],
        count: json["count"],
        storeName: json["StoreName"],
        storeImage: json["StoreImage"],
        deliverDuration: json["DeliverDuration"],
        deliverFees: json["DeliverFees"],
        minReqAmount: json["min_req_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "item_id": itemId,
        "ItemImage": itemImage,
        "count": count,
        "StoreName": storeName,
        "StoreImage": storeImage,
        "DeliverDuration": deliverDuration,
        "DeliverFees": deliverFees,
        "min_req_amount": minReqAmount,
      };
}




// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

// class CartModel {
//   CartModel({
//     required this.userBasket,
//     required this.status,
//   });

//   List<UserBasket> userBasket;
//   String status;

//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//         userBasket: List<UserBasket>.from(
//             json["UserBasket"].map((x) => UserBasket.fromJson(x))),
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "UserBasket": List<dynamic>.from(userBasket.map((x) => x.toJson())),
//         "status": status,
//       };
// }

// class UserBasket {
//   UserBasket({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.itemId,
//     required this.imagePath,
//     required this.count,
//     required this.storeName,
//   });

//   int id;
//   String name;
//   int price;
//   int itemId;
//   String imagePath;
//   int count;
//   String storeName;

//   factory UserBasket.fromJson(Map<String, dynamic> json) => UserBasket(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         itemId: json["item_id"],
//         imagePath: json["image_path"],
//         count: json["count"],
//         storeName: json["StoreName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "item_id": itemId,
//         "image_path": imagePath,
//         "count": count,
//         "StoreName": storeName,
//       };
// }
