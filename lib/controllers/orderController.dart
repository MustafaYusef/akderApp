import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/data/cartModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/orderModel.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:akhder_app/ui/clientOrder/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  // var isLoadingCart = false.obs;

  var current = 0.obs;
  var noNetFlage = false.obs;
  var image = "".obs;
  var token = "".obs;
  var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var myOrder = <MyOrder>[].obs;
  CartController controller = Get.put(CartController());
  @override
  void onInit() {
    repo = MainRepostary();
    getOrder();
    super.onInit();
  }

  Future<void> makeOrder() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.makeOrder(token);

      print("token    :" + token!);
      // final dd = await getProfile();
      Get.back();
      controller.getCart();
      Get.delete<OrderController>();

      Get.off(MyOrderScreen());

      showSnake("تم إرسال الطلب بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake(_.toString());
    }
  }

  Future<void> getOrder() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      try {
        isLoading.value = true;
        // var playerId = await getuserId();
        // SharedPreferences prefs = await SharedPreferences.getInstance();

        // String? token = await prefs.getString('token');
        final login = await repo.getMyOrder(token);
        myOrder.assignAll(login.myOrder);
        // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
        // print("isLiked    : " + isLiked.value.toString());
        print("favourite   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
        print(myOrder);
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

  // Future<void> deleteCart(int id) async {
  //   Get.dialog(popUpLoading(), barrierDismissible: false);
  //   try {
  //     // var playerId = await getuserId();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');
  //     final login = await repo.deleteCart(id: id, token: token!);

  //     print("token    :" + token);
  //     // final dd = await getProfile();
  //     Get.back();

  //     showSnake("تم الحذف بنجاح");
  //     getCart();
  //   } on SocketException catch (_) {
  //     Get.back();
  //     showSnake(noNet);
  //   } catch (_) {
  //     Get.back();
  //     showSnake("لديك خطأ في معلومات الدخول");
  //   }
  // }
}
