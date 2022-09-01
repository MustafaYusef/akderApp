import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/cartModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/methods/methods.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  // var isLoadingCart = false.obs;
  var countArray = <int>[].obs;

  var current = 0.obs;
  var noNetFlage = false.obs;
  var image = "".obs;
  var token = "".obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var myCart = <UserBasket>[].obs;
  @override
  void onInit() {
    repo = MainRepostary();
    getCart();
    super.onInit();
  }

  Future<void> addCart(int id, int count) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      if (token == null) {
        Get.back();
        logOut();
      } else {
        final login = await repo.addToCart(id: id, token: token, count: count);

        print("token    :" + token);
        // final dd = await getProfile();
        Get.back();
        // showSnake("تم الإضافة بنجاح");
        getCart();
      }
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake(_.toString());
    }
  }

  Future<void> getCart() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      try {
        isLoading.value = true;
        // var playerId = await getuserId();
        sumCart.value = 0;
        // SharedPreferences prefs = await SharedPreferences.getInstance();

        // String? token = await prefs.getString('token');
        print("token   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
        print(token);
        final login = await repo.getCart(token);
        myCart.assignAll(login.userBasket);
        countArray.value = login.userBasket.map((e) => e.count).toList();

        myCart.forEach((e) {
          sumCart.value += (e.price * e.count);
        });
        // print("isLiked    : " + isLiked.value.toString());
        print("favourite   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
        print(myCart);
        isLoading.value = false;

        // final dd = await getProfile();
        // Get.back();

        // showSnake("تم الإضافة بنجاح");
      } on SocketException catch (_) {
        isLoading.value = false;

        showSnake(noNet);
      } catch (_) {
        isLoading.value = false;

        showSnake(_.toString());
      }
    }
  }

  Future<void> deleteCart(int id) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.deleteCart(id: id, token: token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();

      // showSnake("تم الحذف بنجاح");
      getCart();
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }

  Future<void> deleteAllCart() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.deleteAllCart(token: token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();
      Get.back();

      // showSnake("تم تفريغ السلة");
      getCart();
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }
}
