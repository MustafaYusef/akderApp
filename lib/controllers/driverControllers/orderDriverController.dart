import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/driverArchiveData.dart';
import 'package:akhder_app/data/driverCurrentOrderModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/stockItem.dart';
import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverOrderController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  var isTaskLoading = true.obs;

  var isArchiveLoading = true.obs;

  // var isLoadingCart = false.obs;

  var current = 0.obs;
  var noNetFlage = false.obs;

  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var myCurrentOrder = <DriverCurrentOrder>[].obs;
  var myArchiveOrder = <DriverOrder>[].obs;

  var myTaskOrder = <DriverCurrentOrder>[].obs;

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
  Future<void> getArchiveOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isArchiveLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      print("token ... ... . .. . ... .. .. ...   ");
      print(token);
      final login = await repo.getDriverOrderArchive(token!);
      myArchiveOrder.assignAll(login.orders!);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "myCurrentOrder   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myArchiveOrder);
      isArchiveLoading.value = false;

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isArchiveLoading.value = false;

      showSnake(noNet);
    } catch (_) {
      isArchiveLoading.value = false;
      print(_.toString());
      showSnake(_.toString());
    }
  }

  Future<void> getCurrentOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getDriverCurrentOrder(token!);
      myCurrentOrder.assignAll(login.orders);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "myCurrentOrder   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myCurrentOrder);
      isLoading.value = false;

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isLoading.value = false;

      showSnake(noNet);
    } catch (_) {
      isLoading.value = false;

      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  Future<void> getTaskOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isTaskLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getDriverTaskOrder(token!);
      myTaskOrder.assignAll(login.orders);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print("myTaskOrder   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myTaskOrder);
      isTaskLoading.value = false;

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isTaskLoading.value = false;

      showSnake(noNet);
    } catch (_) {
      isTaskLoading.value = false;

      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  Future<void> changeStatus(int id, int statusCode) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      final login = await repo.changeOrderDriverStatus(id, statusCode, token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();
      Get.back();
      getTaskOrder();

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

  Future<void> approveOrder(int id) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      final login = await repo.approveByDriver(id, 1, token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();
      Get.back();
      getTaskOrder();
      getCurrentOrder();
      showSnake("تمت الموافقة على الطلب");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }
}
