import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDetailsController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  var isLoadingCart = false.obs;

  var current = 0.obs;
  var noNetFlage = false.obs;
  var image = "".obs;
  var token = "".obs;
  // var countArray = <int>[].obs;
  var sum = 0.obs;
  // var itemId = 0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    getInit();
    super.onInit();
  }

  Future<void> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = await prefs.getString('token');
    if (token == null) {
      needLogin.value = true;
    } else {
      needLogin.value = false;
    }
  }

  // Future<void> addFavourite() async {
  //   Get.dialog(popUpLoading(), barrierDismissible: false);
  //   try {
  //     // var playerId = await getuserId();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');
  //     final login = await repo.addFavourite(itemId.value, token!);

  //     print("token    :" + token);
  //     // final dd = await getProfile();
  //     Get.back();

  //     showSnake("تم الإضافة بنجاح");
  //   } on SocketException catch (_) {
  //     Get.back();
  //     showSnake(noNet);
  //   } catch (_) {
  //     Get.back();
  //     showSnake("لديك خطأ في معلومات الدخول");
  //   }
  // }
}
