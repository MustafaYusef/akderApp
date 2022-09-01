import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/stockItem.dart';
import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/data/vendorHistoryOrder.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderVendorController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  // var isLoadingCart = false.obs;
  var isLoadingHistory = true.obs;

  var current = 0.obs;
  var noNetFlage = false.obs;

  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var myCurrentOrder = <OrderVendor>[].obs;
  var myHistoryOrder = <OrderVendor>[].obs;

  @override
  void onInit() {
    repo = MainRepostary();
    // getStocks();
    super.onInit();
  }

  // Future<void> addFavourite(int id) async {
  //   Get.dialog(popUpLoading(), barrierDismissible: false);
  //   try {
  //     // var playerId = await getuserId();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');
  //     final login = await repo.addFavourite(id, token!);

  //     print("token    :" + token);
  //     // final dd = await getProfile();
  //     Get.back();
  //     showSnake("تم الإضافة بنجاح");
  //     getFavourite();
  //   } on SocketException catch (_) {
  //     Get.back();
  //     showSnake(noNet);
  //   } catch (_) {
  //     Get.back();
  //     showSnake(_.toString());
  //   }
  // }

  Future<void> getHistoryOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isLoadingHistory.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getVendorHistory(token!);
      myHistoryOrder.assignAll(login.history);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "myHistoryOrder   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myHistoryOrder);
      isLoadingHistory.value = false;

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isLoadingHistory.value = false;

      showSnake(noNet);
    } catch (_) {
      isLoadingHistory.value = false;

      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  Future<void> getCurrentOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getVendorCurrentOrder(token!);
      myCurrentOrder.assignAll(login.orders);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "myCurrentOrder   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myCurrentOrder);
      isLoading.value = false;

      // final dd = await getProfile();
      // Get.back();
      // printInvoice();
      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isLoading.value = false;

      showSnake(noNet);
    } catch (_) {
      isLoading.value = false;

      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  Future<void> changeStatus(int id, int statusCode) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.changeOrderVendorStatus(id, statusCode, token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();
      Get.back();

      getCurrentOrder();

      showSnake("تم تغيير الحالة بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }
}
