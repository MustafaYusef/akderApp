import 'dart:io';

import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/searchItem.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/categoryItemsScreen.dart';
import 'package:get/get.dart';

class SearchItemsController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isExpanded = false.obs;
  var categoryItems = <Result>[].obs;
  // var shopsDetails = ShopDetailsModel().obs;
  var isItemLoading = false.obs;
  var id = 0.obs;
  @override
  void onInit() {
    repo = MainRepostary();

    super.onInit();
  }

  Future<void> getShopItem(int shopId, String query) async {
    isItemLoading.value = true;
    noNetFlage.value = false;
    print("shopId   ..... ... .. .. .. . ");
    print(shopId);
    try {
      final prof = await repo.searchItems(shopId, query);
      categoryItems.value = prof.result;
      print("shops category .. ................. ..... .... ");
      print(prof.result);
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
