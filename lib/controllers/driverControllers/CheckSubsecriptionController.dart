import 'dart:io';
import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/driverCurrentOrderModel.dart';
import 'package:akhder_app/data/profileModel.dart';
import 'package:akhder_app/data/subscripModel.dart';
import 'package:akhder_app/data/userInfo.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/driver/SupPopUp.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSubsecriptionController extends GetxController {
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
  var userId = "".obs;
  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  var selectedPlanId = 0.obs;
  var selectedPlan =
      Subscription(cost: 0, createdAt: "", id: 0, name: "", updatedAt: "").obs;
  var plans = <Subscription>[].obs;
  // var isLiked = false.obs;
  var profile = UserInfoModel(userName: "").obs;
  // var myTaskOrder = <DriverCurrentOrder>[].obs;

  @override
  void onInit() {
    repo = MainRepostary();
    getPlans();
    super.onInit();
  }

  Future<void> storePlan(int userId, int planId) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.storeUserPlan(userId, planId, token!);
      // plans.assignAll(login.subscription);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "profile.value   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      // print(login.value.);

      // final dd = await getProfile();
      Get.back();
      Get.back();
      Get.back();

      showSnake("تم الإشتراك بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake(_.toString());
    }
  }

  Future<void> getPlans() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getPlans(token!);
      plans.assignAll(login.subscription);
      // plans.addAll(login.subscription);
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "profile.value   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(plans.value);
      // getUserInfo("2");/

      // final dd = await getProfile();
      // Get.back();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      // Get.back();
      showSnake(noNet);
    } catch (_) {
      // Get.back();
      showSnake(_.toString());
    }
  }
  // Future<void> addFavourite(int id) async {
  //   Get.dialog(popUpLoading(), barrierDismissible: false);
  //   try {
  //     // var playerId = await getuserId();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');
  //     final login = await repo.addFavourite(id, token!);

  //     print("token    :" + token);
  //     // final dd = await getProfile();
  //     Get.back();
  //     showSnake("تم الإضافة بنجاح");
  //     getFavourite();
  //   } on SocketException catch (_) {
  //     Get.back();
  //     showSnake(noNet);
  //   } catch (_) {
  //     Get.back();
  //     showSnake(_.toString());
  //   }
  // }

  Future<void> getUserInfo(String user_id) async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      // isLoading.value = true;
      // var playerId = await getuserId();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = await prefs.getString('token');
      final login = await repo.getUserInfo(token!, user_id);
      profile.value = login;
      // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
      // print("isLiked    : " + isLiked.value.toString());
      print(
          "profile.value   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
      print(profile.value);
      // final dd = await getProfile();
      Get.back();
      SupPopUp();

      // showSnake("تم الإضافة بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("لديك خطأ في معلومات الدخول");
    }
  }
}
