import 'dart:io';
import 'package:akhder_app/const.dart';
import 'package:akhder_app/data/driverCurrentOrderModel.dart';
import 'package:akhder_app/data/profileModel.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
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

  // var countArray = <int>[].obs;
  // var sum = 0.obs;
  var itemId = 0.obs;
  // var isLiked = false.obs;
  var profile =
      ProfileInfo(name: "", number: "", subscriptionType: "", userId: 0).obs;
  // var myTaskOrder = <DriverCurrentOrder>[].obs;

  @override
  void onInit() {
    repo = MainRepostary();
    getProfile();
    // getStocks();
    super.onInit();
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

  Future<void> getProfile() async {
    // Get.dialog(popUpLoading(), barrierDismissible: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    if (token != null) {
      needLogin.value = false;

      try {
        isLoading.value = true;
        // var playerId = await getuserId();

        final login = await repo.getProfile(token);
        profile.value = login.profileInfo;
        // isLiked.value = myFavourite.firstWhere((e) => e.id == itemId.value);
        // print("isLiked    : " + isLiked.value.toString());
        print(
            "profile.value   ... . .. .. .. . .. .. .. . . .. .. . . .. . .  .");
        print(profile.value);
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
    } else {
      needLogin.value = true;
    }
  }
}
