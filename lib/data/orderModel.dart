// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

class OrderModel {
  OrderModel({
    required this.myOrder,
    required this.status,
  });

  List<MyOrder> myOrder;
  String status;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        myOrder:
            List<MyOrder>.from(json["MyOrder"].map((x) => MyOrder.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "MyOrder": List<dynamic>.from(myOrder.map((x) => x.toJson())),
        "status": status,
      };
}

class MyOrder {
  MyOrder({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.vendorId,
    required this.driverId,
    required this.orderStatus,
    required this.status,
    required this.finalPrice,
    required this.itemsData,
  });

  int id;
  int userId;
  String items;
  String totalPrice;
  DateTime createdAt;
  DateTime updatedAt;
  int vendorId;
  int driverId;
  int orderStatus;
  String status;
  String finalPrice;
  List<ItemsDatum> itemsData;

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        id: json["id"],
        userId: json["user_id"],
        items: json["items"],
        totalPrice: json["totalPrice"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendorId: json["vendor_id"],
        driverId: json["driver_id"],
        orderStatus: json["orderStatus"],
        status: json["status"],
        finalPrice: json["FinalPrice"],
        itemsData: List<ItemsDatum>.from(
            json["ItemsData"].map((x) => ItemsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "items": items,
        "totalPrice": totalPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vendor_id": vendorId,
        "driver_id": driverId,
        "orderStatus": orderStatus,
        "status": status,
        "FinalPrice": finalPrice,
        "ItemsData": List<dynamic>.from(itemsData.map((x) => x.toJson())),
      };
}

class ItemsDatum {
  ItemsDatum({
    required this.id,
    required this.name,
    required this.description,
    required this.catId,
    required this.price,
    required this.imagePath,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
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
  int isActive;

  factory ItemsDatum.fromJson(Map<String, dynamic> json) => ItemsDatum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        catId: json["cat_id"],
        price: json["price"],
        imagePath: json["image_path"],
        storeId: json["store_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isActive: json["IsActive"],
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
        "IsActive": isActive,
      };
}


// OrderModel orderModelFromJson(String str) =>
//     OrderModel.fromJson(json.decode(str));

// class OrderModel {
//   OrderModel({
//     required this.myOrder,
//     required this.status,
//   });

//   List<MyOrder> myOrder;
//   String status;

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         myOrder:
//             List<MyOrder>.from(json["MyOrder"].map((x) => MyOrder.fromJson(x))),
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "MyOrder": List<dynamic>.from(myOrder.map((x) => x.toJson())),
//         "status": status,
//       };
// }

// class MyOrder {
//   MyOrder({
//     required this.id,
//     required this.userId,
//     required this.items,
//     required this.totalPrice,
//     required this.finalPrice,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.itemsData,
//   });

//   int id;
//   int userId;
//   String items;
//   String totalPrice;
//   String status;
//   int finalPrice;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<ItemsDatum> itemsData;

//   factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
//         id: json["id"],
//         userId: json["user_id"],
//         items: json["items"],
//         totalPrice: json["totalPrice"],
//         status: json["status"],
//         finalPrice: json["FinalPrice"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         itemsData: List<ItemsDatum>.from(
//             json["ItemsData"].map((x) => ItemsDatum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "items": items,
//         "totalPrice": totalPrice,
//         "status": status,
//         "FinalPrice": finalPrice,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "ItemsData": List<dynamic>.from(itemsData.map((x) => x.toJson())),
//       };
// }

// class ItemsDatum {
//   ItemsDatum({
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

//   factory ItemsDatum.fromJson(Map<String, dynamic> json) => ItemsDatum(
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
