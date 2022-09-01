// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:akhder_app/data/driverCurrentOrderModel.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'orderModel.dart';

DriverArciveModel driverArciveModelFromJson(String str) =>
    DriverArciveModel.fromJson(json.decode(str));

class DriverArciveModel {
  DriverArciveModel({
    required this.orders,
  });

  List<DriverOrder>? orders;

  factory DriverArciveModel.fromJson(Map<String, dynamic> json) =>
      DriverArciveModel(
        orders: json["Orders"] == null
            ? null
            : List<DriverOrder>.from(
                json["Orders"].map((x) => DriverOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Orders": orders == null
            ? null
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class DriverOrder {
  DriverOrder({
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int vendorId;
  int driverId;
  int orderStatus;
  String status;
  String finalPrice;
  List<ItemsCurrentDriverOrder>? itemsData;

  factory DriverOrder.fromJson(Map<String, dynamic> json) => DriverOrder(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        items: json["items"] == null ? null : json["items"],
        totalPrice: json["totalPrice"] == null ? null : json["totalPrice"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        vendorId: json["vendor_id"] == null ? null : json["vendor_id"],
        driverId: json["driver_id"] == null ? null : json["driver_id"],
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        status: json["status"] == null ? null : json["status"],
        finalPrice: json["FinalPrice"] == null ? null : json["FinalPrice"],
        itemsData: json["ItemsData"] == null
            ? null
            : List<ItemsCurrentDriverOrder>.from(json["ItemsData"]
                .map((x) => ItemsCurrentDriverOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "items": items == null ? null : items,
        "totalPrice": totalPrice == null ? null : totalPrice,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "vendor_id": vendorId == null ? null : vendorId,
        "driver_id": driverId == null ? null : driverId,
        "orderStatus": orderStatus == null ? null : orderStatus,
        "status": status == null ? null : status,
        "FinalPrice": finalPrice == null ? null : finalPrice,
        "ItemsData": itemsData == null
            ? null
            : List<dynamic>.from(itemsData!.map((x) => x.toJson())),
      };
}

// class ItemsDatum {
//   ItemsDatum({
//     @required this.id,
//     @required this.name,
//     @required this.description,
//     @required this.catId,
//     @required this.price,
//     @required this.imagePath,
//     @required this.storeId,
//     @required this.createdAt,
//     @required this.updatedAt,
//     @required this.isActive,
//   });

//   int id;
//   String name;
//   String description;
//   int catId;
//   int price;
//   String imagePath;
//   int storeId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int isActive;

//   factory ItemsDatum.fromJson(Map<String, dynamic> json) => ItemsDatum(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         description: json["description"] == null ? null : json["description"],
//         catId: json["cat_id"] == null ? null : json["cat_id"],
//         price: json["price"] == null ? null : json["price"],
//         imagePath: json["image_path"] == null ? null : json["image_path"],
//         storeId: json["store_id"] == null ? null : json["store_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         isActive: json["IsActive"] == null ? null : json["IsActive"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "description": description == null ? null : description,
//         "cat_id": catId == null ? null : catId,
//         "price": price == null ? null : price,
//         "image_path": imagePath == null ? null : imagePath,
//         "store_id": storeId == null ? null : storeId,
//         "created_at": createdAt == null ? null : createdAt.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
//         "IsActive": isActive == null ? null : isActive,
//       };
// }
