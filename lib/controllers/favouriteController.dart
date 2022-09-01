import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
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
  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var myFavourite = <MyFavor>[].obs;
  @override
  void onInit() {
    repo = MainRepostary();
    getFavourite();
    super.onInit();
  }

  Future<void> addFavourite(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      Get.dialog(popUpLoading(), barrierDismissible: false);
      try {
        // var playerId = await getuserId();

        final login = await repo.addFavourite(id, token);

        print("token    :" + token);
        // final dd = await getProfile();
        Get.back();
        // showSnake("تم الإضافة بنجاح");
        getFavourite();
      } on SocketException catch (_) {
        Get.back();
        showSnake(noNet);
      } catch (_) {
        Get.back();
        showSnake(_.toString());
      }
    }
  }

  Future<void> getFavourite() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      try {
        isLoading.value = true;
        // var playerId = await getuserId();

        final login = await repo.getFavourite(token);
        myFavourite.assignAll(login.myFavor);
        // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
        // print("isLiked    : " + isLiked.value.toString());
        print("favourite   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
        print(myFavourite);
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
  }

  Future<void> deleteFavourite(int id) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.deleteFavourite(id, token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();

      // showSnake("تم الحذف بنجاح");
      getFavourite();
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }
}
