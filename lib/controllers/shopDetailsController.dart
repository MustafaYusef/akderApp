import 'dart:io';

import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/offersItem.dart';
import 'package:akhder_app/data/shopBrand.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/data/shopSlider.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:get/get.dart';

import '../methods/closeShopPopUp.dart';

class ShopDetailsController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isCategoryLoading = true.obs;
  var isExpanded = false.obs;
  var isClose = 0.obs;
  var shopsDetails = ShopDetailsModel().obs;
  var shopSlider = <ShopPromotion>[].obs;
  var isItemLoading = true.obs;
  var topFiveItem = <Item>[].obs;
  var offerItem = <ShopOffer>[].obs;
  var shopBrands = <ShopBrand>[].obs;
  var sliderLoading = true.obs;
  var brandLoading = true.obs;
  var topFiveLoading = true.obs;
  // var offersItem = <ShopOffer>[].obs;
  var isOfferLoading = true.obs;

  var id = 0.obs;
  @override
  void onInit() {
    repo = MainRepostary();

    super.onInit();
  }

  Future<void> getShopDetails(int id) async {
    isCategoryLoading.value = true;
    noNetFlage.value = false;
    print("id   ..... ... .. .. .. . ");
    print(id);
    try {
      final prof = await repo.getshopDetails(id);

      shopsDetails.value = prof;
      getShopPromotion(id);
      getShopBrand(id);
      getShopOffer(id);
      getShoptopFive(id);
      // getShoptopFive(id);

      print("shops category .. ................. ..... .... ");
      print(prof.shopDetails);
      isCategoryLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isCategoryLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isCategoryLoading.value = false;
    }
    if (isClose.value == 1) {
      CloseShopCartPop();
    }
  }

  Future<void> getShopPromotion(int shopId) async {
    sliderLoading.value = true;
    noNetFlage.value = false;
    print("shopId   ..... ... .. .. .. . ");
    print(shopId);
    try {
      final prof = await repo.getShopBanners(shopId);
      shopSlider.assignAll(prof.shopPromotions);
      print("shops category .. ................. ..... .... ");
      print(prof.shopPromotions);
      sliderLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      sliderLoading.value = false;
    } catch (_) {
      showSnake(_.toString());
      print(_);
      sliderLoading.value = false;
    }
  }

  Future<void> getShoptopFive(int shopId) async {
    topFiveLoading.value = true;
    noNetFlage.value = false;
    print("shopId   ..... ... .. .. .. . ");
    print(shopId);
    try {
      final prof = await repo.getTopFive(shopId);
      topFiveItem.assignAll(prof.itemsTopFive);
      print("shops topFive .. ................. ..... .... ");
      print(prof.itemsTopFive);
      topFiveLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      topFiveLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      topFiveLoading.value = false;
    }
  }

  Future<void> getShopOffer(int shopId) async {
    isOfferLoading.value = true;
    noNetFlage.value = false;
    print("shopId   ..... ... .. .. .. . ");
    print(shopId);
    try {
      final prof = await repo.getShopOffers(shopId);
      offerItem.assignAll(prof.shopOffers);
      print("shops category .. ................. ..... .... ");
      print(prof.shopOffers);
      isOfferLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isOfferLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isOfferLoading.value = false;
    }
  }

  Future<void> getShopBrand(int shopId) async {
    brandLoading.value = true;
    noNetFlage.value = false;
    print("shopId   ..... ... .. .. .. . ");
    print(shopId);
    try {
      final prof = await repo.getShopBrands(shopId);
      shopBrands.assignAll(prof.shopBrands);
      print("shops brand .. ................. ..... .... ");
      print(prof.shopBrands);
      brandLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      brandLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      brandLoading.value = false;

      showSnake(_.toString());
      print(_);
      // isItemLoading.value = false;
    }
  }
}
