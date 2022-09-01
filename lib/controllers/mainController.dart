import 'dart:io';

import 'package:akhder_app/controllers/profileController.dart';
import 'package:akhder_app/data/bannersData.dart';
import 'package:akhder_app/data/mainCategory.dart';
import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/methods/locationEnablePop.dart';
import 'package:akhder_app/methods/locationServices.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/listWidget.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/driver/driverCurrentOrderScreen.dart';
import 'package:akhder_app/ui/vendor/stockItemScreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  late MainRepostary repo;
  var noNetFlage = false.obs;
  var isLoadingMainCategory = false.obs;
  var isLoadingCategoryShop = false.obs;
  var bannersLoading = true.obs;
  var mainCategoryList = <MainCategory>[].obs;
  var shopsList = <ShopCategoryModel>[].obs;
  var mainBanners = <PromotionImage>[].obs;
  var mainBanners2 = <PromotionImage>[].obs;
  var mainBanners3 = <PromotionImage>[].obs;
  var mainBanners4 = <PromotionImage>[].obs;

  var isLoadingShopDetails = true.obs;
  var shopsDetails = ShopDetailsModel().obs;
  var nearShops = <Shop>[].obs;
  var conH = 100.0.obs;
  var nearLoading = true.obs;
  var shopSingle = <Shop>[].obs;
  var isNearLoading = true.obs;
  var role = "".obs;
  var nearShopsDetails = <ShopDetailsModel>[].obs;

  @override
  void onInit() {
    repo = MainRepostary();
    getRole();
    getMain();
    getNearshop();
    super.onInit();
  }

  getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    role.value = prefs.getString('role').toString();
    if (role.value == "vendor") {
      Get.off(StockVendorScreen());
    } else if (role.value == "driver") {
      Get.off(DriverCurrentOrderScreen());
    }
  }

  Future<void> getShopDetails(int id) async {
    isLoadingShopDetails.value = true;
    noNetFlage.value = false;
    print("id   ..... ... .. .. .. . ");
    print(id);
    try {
      final prof = await repo.getshopDetails(id);
      shopsDetails.value = prof;
      print("shops category .. ................. ..... .... ");
      print(prof.shopDetails);
      isLoadingShopDetails.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingShopDetails.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingShopDetails.value = false;
    }
  }

  Future<void> getShops() async {
    isLoadingCategoryShop.value = true;
    noNetFlage.value = false;
    shopsList.clear();
    try {
      mainCategoryList.forEach((e) async {
        final prof = await repo.getShopsByCategory(e.id);

        shopsList.addIf(prof.shops.isNotEmpty, prof);
      });
      isLoadingCategoryShop.value = false;
      getShopDetails(1);
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingCategoryShop.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingCategoryShop.value = false;
    }
  }

  Future<void> getShopSingel(int id, String name) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);

    noNetFlage.value = false;

    try {
      final prof = await repo.getShopsByCategory(id);
      shopSingle.assignAll(prof.shops);
      Get.back();
      modalBottomSheetMenu(shopSingle, name);
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      Get.back();

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      Get.back();
    }
  }

  Future<void> getMain() async {
    isLoadingMainCategory.value = true;

    try {
      getRole();

      final prof = await repo.getMainCategory();
      mainCategoryList.assignAll(prof.mainCategory);
      print("mainCategoryList ........ . ..");
      print(mainCategoryList);
      isLoadingMainCategory.value = false;
      getBanners();
      getShops();
      getNearshop();
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      isLoadingMainCategory.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      isLoadingMainCategory.value = false;
    }
  }

  Future<void> getBanners() async {
    bannersLoading.value = true;
    noNetFlage.value = false;

    try {
      final banners = await repo.getMainBanners();
      final banners2 = await repo.getBannersSecond();
      final banners3 = await repo.getBannersThird();
      final banners4 = await repo.getBannersForth();

      mainBanners.assignAll(banners.promotionImages);
      mainBanners2.assignAll(banners2.promotionImages);
      mainBanners3.assignAll(banners3.promotionImages);
      mainBanners4.assignAll(banners4.promotionImages);

      bannersLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      bannersLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      bannersLoading.value = false;
    }
  }

  Future<void> getNearshop() async {
    nearLoading.value = true;
    noNetFlage.value = false;
    Position? location;
    noNetFlage.value = false;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // uploadOfflineController.getCount();
    if (!serviceEnabled) {
      // location = null;
      EnableGpsPop(Get.context);
    } else {
      location = (await getLocation());
    }
    try {
      final prof =
          await repo.getNearShops(location!.latitude, location.longitude);

      nearShops.assignAll(prof.nearShop);
      // getShopDetails()
      nearLoading.value = false;
    } on SocketException catch (_) {
      showSnake("noInternet");
      noNetFlage.value = true;
      nearLoading.value = false;

      // emit(MyOrdercubiteNoInternet());
    } catch (_) {
      showSnake(_.toString());
      print(_);
      nearLoading.value = false;
    }
  }
}
