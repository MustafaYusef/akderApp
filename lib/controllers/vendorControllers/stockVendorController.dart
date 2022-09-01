import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/stockItem.dart';
import 'package:akhder_app/data/vendorCategory.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockVendorController extends GetxController {
  MainRepostary repo = MainRepostary();
  var count = 1.obs;
  var sumCart = 0.obs;
  var isColorSelected = true.obs;
  var isAddToCart = false.obs;
  var needLogin = false.obs;
  var isLoading = true.obs;
  // var isLoadingCart = false.obs;
  var isCatLoading = true.obs;

  var vendorCat = <Cat>[].obs;
  var current = 0.obs;
  var noNetFlage = false.obs;

  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var catId = 0.obs;
  // var isLiked = false.obs;
  var myStockItems = <ItemStock>[].obs;
  @override
  void onInit() {
    repo = MainRepostary();
    // getStocks();
    getCategory();
    super.onInit();
  }

  Future<void> getCategory() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isCatLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getVendorCat(token!);
      vendorCat.assignAll(login.cats);
      catId.value = vendorCat[0].id;
      getStocks(catId.value);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print("vendorCat   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(vendorCat);
      isCatLoading.value = false;

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      isCatLoading.value = false;

      showSnake(noNet);
    } catch (_) {
      isCatLoading.value = false;

      showSnake(_.toString());
    }
  }

  Future<void> getStocks(int catId) async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getVendorStockByCat(token!, catId);
      myStockItems.assignAll(login.items);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print("myStockItems   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(myStockItems);
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

  Future<void> changeStatus(int id, int statusCode) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.stockStatusChange(id, statusCode, token!);

      print("token    :" + token);
      // final dd = await getProfile();
      Get.back();
      getStocks(catId.value);
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
