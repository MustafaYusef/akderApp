// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

VendorHistoryOrderModel vendorHistoryOrderModelFromJson(String str) =>
    VendorHistoryOrderModel.fromJson(json.decode(str));

class VendorHistoryOrderModel {
  VendorHistoryOrderModel({
    required this.history,
  });

  List<OrderVendor> history;

  factory VendorHistoryOrderModel.fromJson(Map<String, dynamic> json) =>
      VendorHistoryOrderModel(
        history: List<OrderVendor>.from(
            json["History"].map((x) => OrderVendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "History": List<dynamic>.from(history.map((x) => x.toJson())),
      };
}

// class OrderVendor {
//   OrderVendor({
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
//   List<ItemsVendorOrder> itemsData;

//   factory History.fromJson(Map<String, dynamic> json) => History(
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
//         itemsData: List<ItemsVendorOrder>.from(
//             json["ItemsData"].map((x) => ItemsVendorOrder.fromJson(x))),
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
