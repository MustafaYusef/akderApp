// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DriverCurrentOrderModel driverCurrentOrderModelFromJson(String str) =>
    DriverCurrentOrderModel.fromJson(json.decode(str));

class DriverCurrentOrderModel {
  DriverCurrentOrderModel({
    required this.orders,
  });

  List<DriverCurrentOrder> orders;

  factory DriverCurrentOrderModel.fromJson(Map<String, dynamic> json) =>
      DriverCurrentOrderModel(
        orders: List<DriverCurrentOrder>.from(
            json["Orders"].map((x) => DriverCurrentOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class DriverCurrentOrder {
  DriverCurrentOrder({
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
  List<ItemsCurrentDriverOrder> itemsData;

  factory DriverCurrentOrder.fromJson(Map<String, dynamic> json) =>
      DriverCurrentOrder(
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
        itemsData: List<ItemsCurrentDriverOrder>.from(
            json["ItemsData"].map((x) => ItemsCurrentDriverOrder.fromJson(x))),
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

class ItemsCurrentDriverOrder {
  ItemsCurrentDriverOrder({
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
  DateTime createdAt;
  DateTime updatedAt;
  int isActive;

  factory ItemsCurrentDriverOrder.fromJson(Map<String, dynamic> json) =>
      ItemsCurrentDriverOrder(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        catId: json["cat_id"],
        price: json["price"],
        imagePath: json["image_path"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "IsActive": isActive,
      };
}

// class DriverCurrentOrderModel {
//   DriverCurrentOrderModel({
//     required this.orders,
//   });

//   List<DriverCurrentOrder> orders;

//   factory DriverCurrentOrderModel.fromJson(Map<String, dynamic> json) =>
//       DriverCurrentOrderModel(
//         orders: List<DriverCurrentOrder>.from(
//             json["Orders"].map((x) => DriverCurrentOrder.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Orders": List<dynamic>.from(orders.map((x) => x.toJson())),
//       };
// }

// class DriverCurrentOrder {
//   DriverCurrentOrder({
//     required this.id,
//     required this.userId,
//     required this.items,
//     required this.totalPrice,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.vendorId,
//     required this.driverId,
//     required this.orderStatus,
//     required this.status,
//     required this.finalPrice,
//     required this.itemsData,
//   });

//   int id;
//   int userId;
//   String items;
//   String totalPrice;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int vendorId;
//   int driverId;
//   int orderStatus;
//   String status;
//   String finalPrice;
//   List<ItemsCurrentDriverOrder> itemsData;

//   factory DriverCurrentOrder.fromJson(Map<String, dynamic> json) =>
//       DriverCurrentOrder(
//         id: json["id"],
//         userId: json["user_id"],
//         items: json["items"],
//         totalPrice: json["totalPrice"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         vendorId: json["vendor_id"],
//         driverId: json["driver_id"],
//         orderStatus: json["orderStatus"],
//         status: json["status"],
//         finalPrice: json["FinalPrice"],
//         itemsData: List<ItemsCurrentDriverOrder>.from(
//             json["ItemsData"].map((x) => ItemsCurrentDriverOrder.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "items": items,
//         "totalPrice": totalPrice,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "vendor_id": vendorId,
//         "driver_id": driverId,
//         "orderStatus": orderStatus,
//         "status": status,
//         "FinalPrice": finalPrice,
//         "ItemsData": List<dynamic>.from(itemsData.map((x) => x.toJson())),
//       };
// }

// class ItemsCurrentDriverOrder {
//   ItemsCurrentDriverOrder({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.catId,
//     required this.price,
//     required this.imagePath,
//     required this.storeId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isActive,
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
//   int isActive;

//   factory ItemsCurrentDriverOrder.fromJson(Map<String, dynamic> json) =>
//       ItemsCurrentDriverOrder(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         catId: json["cat_id"],
//         price: json["price"],
//         imagePath: json["image_path"],
//         storeId: json["store_id"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         isActive: json["IsActive"],
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
//         "IsActive": isActive,
//       };
// }
