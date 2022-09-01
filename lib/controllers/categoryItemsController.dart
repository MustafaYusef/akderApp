import 'dart:io';

import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/methods/getString.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/categoryItemsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemsController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isCategoryLoading = true.obs;
  var isExpanded = false.obs;
  var categoryItems = <Item>[].obs;
  // var countArray = <int>[].obs;

  var isItemLoading = true.obs;
  var id = 0.obs;
  @override
  void onInit() {
    repo = MainRepostary();
    // showMaterialBanner();
    super.onInit();
  }

  // showMaterialBanner() {
  //   ScaffoldMessenger.of(Get.context!)
  //     ..removeCurrentMaterialBanner()
  //     ..showMaterialBanner(MaterialBanner(
  //       content: const Text('This is Flutter 2.5 Material Banner'),
  //       leading: const Icon(Icons.info),
  //       backgroundColor: Colors.yellow,
  //       actions: [
  //         TextButton(onPressed: () {}, child: const Text('Some Action')),
  //         TextButton(
  //             onPressed: () {
  //               ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
  //             },
  //             child: const Text('Dismiss')),
  //       ],
  //     ));
  // }
  // showMaterialBanner() {
  //   Get.snackbar(getTranslate("لديك بعض العناصر في السلة"),
  //       getTranslate("لديك بعض العناصر في السلة"),
  //       duration: Duration(seconds: 3),
  //       snackPosition: SnackPosition.BOTTOM,
  //       icon: Icon(
  //         Icons.info,
  //         color: Get.theme.primaryColor,
  //       ),
  //       colorText: Colors.black,
  //       backgroundColor: Colors.white.withOpacity(0.9));
  // }

  Future<void> getShopItem(int catId, int shopId) async {
    isItemLoading.value = true;
    noNetFlage.value = false;
    print("id   ..... ... .. .. .. . ");
    print(catId);
    try {
      final prof = await repo.getItemByCategory(catId, shopId);
      categoryItems.value = prof.items;
      // countArray.value = prof.items.map((e) => 1).toList();

      print("shops category .. ................. ..... .... ");
      print(prof.items);
      isItemLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isItemLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isItemLoading.value = false;
    }
  }
}
