import 'dart:convert';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/bannersData.dart';
import 'package:akhder_app/data/cartModel.dart';
import 'package:akhder_app/data/driverArchiveData.dart';
import 'package:akhder_app/data/driverCurrentOrderModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/loginModel.dart';
import 'package:akhder_app/data/mainCategory.dart';
import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:akhder_app/data/nearShopData.dart';
import 'package:akhder_app/data/offersItem.dart';
import 'package:akhder_app/data/orderModel.dart';
import 'package:akhder_app/data/profileModel.dart';
import 'package:akhder_app/data/searchItem.dart';
import 'package:akhder_app/data/shopBrand.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/data/shopSlider.dart';
import 'package:akhder_app/data/stockItem.dart';
import 'package:akhder_app/data/subscripModel.dart';
import 'package:akhder_app/data/topItems.dart';
import 'package:akhder_app/data/userInfo.dart';
import 'package:akhder_app/data/vendorCategory.dart';
import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/data/vendorHistoryOrder.dart';
import 'package:http/http.dart';

import '../data/regesterModel.dart';

class MainRepostary {
  Future<MainCategoryModel> getMainCategory() async {
    final response = await get(Uri.parse(baseUrl + "GetMainCategory"));
    if (response.statusCode == 200) {
      return mainCategoryModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ShopCategoryModel> getShopsByCategory(int catId) async {
    final response =
        await get(Uri.parse(baseUrl + "GetMarketByCategoryId?id=$catId"));
    if (response.statusCode == 200) {
      return shopCategoryModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ItemsModel> getItemByCategory(int catId, int shop_id) async {
    final response = await get(Uri.parse(
        baseUrl + "GetShopsItemsByCat?cat_id=$catId&shop_id=$shop_id"));
    if (response.statusCode == 200) {
      return itemsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<SearchItemModel> searchItems(int shop_id, String query) async {
    print("shop_id . .. . .. .. . ..");

    print(shop_id);
    final response = await get(
        Uri.parse(baseUrl + "SearchItemInShop?id=$shop_id&name=$query"));
    if (response.statusCode == 200) {
      return searchItemModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<TopItemsMode> getTopFive(int shop_id) async {
    final response =
        await get(Uri.parse(baseUrl + "GetShopsItemsTopFive?shop_id=$shop_id"));
    if (response.statusCode == 200) {
      return topItemsModeFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<NearShopModel> getNearShops(double lat, double lon) async {
    final response =
        await get(Uri.parse(baseUrl + "GetNearShopByMe?Lat=$lat&Log=$lon"));
    if (response.statusCode == 200) {
      return nearShopModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ShopDetailsModel> getshopDetails(int shopId) async {
    final response =
        await get(Uri.parse(baseUrl + "GetShopsDetails?id=$shopId"));
    if (response.statusCode == 200) {
      return shopDetailsModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ShopBrandModel> getShopBrands(int shopId) async {
    final response =
        await get(Uri.parse(baseUrl + "GetShopsBrand?shop_id=$shopId"));
    if (response.statusCode == 200) {
      return shopBrandModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ShopSlider> getShopBanners(int shopId) async {
    final response =
        await get(Uri.parse(baseUrl + "GetShopsPromotion?shop_id=$shopId"));
    if (response.statusCode == 200) {
      return shopSliderFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<OfferShopeItems> getShopOffers(int shopId) async {
    final response =
        await get(Uri.parse(baseUrl + "GetShopsOffer?shop_id=$shopId"));
    if (response.statusCode == 200) {
      return offerShopeItemsFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<ProfileModel> getProfile(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetClientProfile?token=$token"));
    if (response.statusCode == 200) {
      return profileModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<UserInfoModel> getUserInfo(String token, String user_id) async {
    final response = await get(
        Uri.parse(baseUrl + "GetUserInfo?token=$token&user_id=$user_id"));
    if (response.statusCode == 200) {
      return userInfoModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<SupscripModel> getPlans(String token) async {
    final response = await get(Uri.parse(baseUrl + "GetPlans?token=$token"));
    if (response.statusCode == 200) {
      return supscripModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<VendorCurrentOrderModel> getVendorCurrentOrder(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetVendorOrder?token=$token"));
    if (response.statusCode == 200) {
      return vendorCurrentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<VendorCurrentOrderModel> getVendorHistoryOrder(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetVendorHistoryOrder?token=$token"));
    if (response.statusCode == 200) {
      return vendorCurrentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannersModel> getMainBanners() async {
    final response = await get(Uri.parse(baseUrl + "GetPromotionImage"));
    if (response.statusCode == 200) {
      return bannersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannersModel> getBannersSecond() async {
    final response =
        await get(Uri.parse(baseUrl + "GetPromotionImageNew?id=1"));
    if (response.statusCode == 200) {
      return bannersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannersModel> getBannersThird() async {
    final response =
        await get(Uri.parse(baseUrl + "GetPromotionImageNew?id=2"));
    if (response.statusCode == 200) {
      return bannersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<BannersModel> getBannersForth() async {
    final response =
        await get(Uri.parse(baseUrl + "GetPromotionImageNew?id=3"));
    if (response.statusCode == 200) {
      return bannersModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<LoginModel> Login(
      String phone, String password, String player_id) async {
    final response = await post(Uri.parse(baseUrl + "login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
            {"number": phone, "password": password, "player_id": player_id}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return loginModelFromJson(response.body);
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<RegesterModel> Regester(
      {required String phone,
      required String name,
      required String password,
      required String player_id}) async {
    final response = await post(Uri.parse(baseUrl + "Register"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "number": phone,
          "password": password,
          "name": name,
          "player_id": player_id
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return regesterModelFromJson(response.body);
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> VerifyUser(
    String token,
    String verification_code,
  ) async {
    final response = await post(Uri.parse(baseUrl + "verify_user"),
        headers: {"Content-Type": "application/json"},
        body: json
            .encode({"verification_code": verification_code, "token": token}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> addFavourite(int id, String token) async {
    final response = await post(Uri.parse(baseUrl + "CreateFavor"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "item": id,
          "token": token,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> addToCart({int? id, String? token, int? count}) async {
    final response = await post(Uri.parse(baseUrl + "updateBasket"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"item_id": id, "token": token, "count": count}));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> makeOrder(String? token) async {
    final response = await post(Uri.parse(baseUrl + "CreateOrder"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"token": token}));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> deleteCart({int? id, String? token}) async {
    final response = await post(Uri.parse(baseUrl + "DeleteBasket"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"item_id": id, "token": token}));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> deleteAllCart({String? token}) async {
    final response = await post(Uri.parse(baseUrl + "DeleteBasketAll"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"token": token}));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> deleteFavourite(int id, String token) async {
    final response = await post(Uri.parse(baseUrl + "DeleteFavor"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "item_id": id,
          "token": token,
        }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> stockStatusChange(int id, int statusCode, String token) async {
    final response =
        await post(Uri.parse(baseUrl + "updateItemStatus?token=$token"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "ItemId": id,
              "statusCode": statusCode,
            }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> changeOrderVendorStatus(
      int id, int statusCode, String token) async {
    final response =
        await post(Uri.parse(baseUrl + "CheckOrderStatus?token=$token"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "OrderId": id,
              "statusCode": statusCode,
            }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> changeOrderDriverStatus(
      int id, int statusCode, String token) async {
    final response =
        await post(Uri.parse(baseUrl + "UpdateDriverOrder?token=$token"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "OrderId": id,
              "statusCode": statusCode,
            }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> approveByDriver(int id, int statusCode, String token) async {
    final response =
        await post(Uri.parse(baseUrl + "ApproveDriverOrder?token=$token"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "OrderId": id,
              "statusCode": statusCode,
            }));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> storeUserPlan(int userId, int planId, String token) async {
    final response = await post(
      Uri.parse(baseUrl +
          "StoreUserPlans?token=$token&userId=$userId&PlanId=$planId"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 403) {
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<CartModel> getCart(String token) async {
    final response = await get(Uri.parse(baseUrl + "GetBasket?token=$token"));
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<VendorCatModel> getVendorCat(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetVendorCat?token=$token"));
    if (response.statusCode == 200) {
      return vendorCatModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<StockItemModel> getVendorStockByCat(String token, int cat_id) async {
    final response = await get(Uri.parse(
        baseUrl + "GetVendorStockByCatId?token=$token&cat_id=$cat_id"));
    if (response.statusCode == 200) {
      return stockItemModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<DriverArciveModel> getDriverOrderArchive(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetDriverArchivedOrder?token=$token"));
    if (response.statusCode == 200) {
      return driverArciveModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<StockItemModel> getStockItem(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetVendorStock?token=$token"));
    if (response.statusCode == 200) {
      return stockItemModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<OrderModel> getMyOrder(String token) async {
    final response = await get(Uri.parse(baseUrl + "MyOrder?token=$token"));
    if (response.statusCode == 200) {
      return orderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<DriverCurrentOrderModel> getDriverCurrentOrder(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetDriverOrder?token=$token"));
    if (response.statusCode == 200) {
      return driverCurrentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<VendorHistoryOrderModel> getVendorHistory(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetVendorHistoryOrder?token=$token"));
    if (response.statusCode == 200) {
      return vendorHistoryOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<DriverCurrentOrderModel> getDriverTaskOrder(String token) async {
    final response =
        await get(Uri.parse(baseUrl + "GetDriverTask?token=$token"));
    if (response.statusCode == 200) {
      return driverCurrentOrderModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }

  Future<MyFavouriteModel> getFavourite(String token) async {
    final response = await get(Uri.parse(baseUrl + "MyFavor?token=$token"));
    if (response.statusCode == 200) {
      return myFavouriteModelToJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception(response.statusCode);
    } else {
      throw Exception('حدث خطأ ما');
    }
  }
}
