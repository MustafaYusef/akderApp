import 'dart:io';

import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/favouriteController.dart';
import 'package:akhder_app/controllers/mainController.dart';
import 'package:akhder_app/controllers/orderController.dart';
import 'package:akhder_app/controllers/profileController.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/methods/methods.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:akhder_app/ui/authUi/VerifyUserScreen.dart';
import 'package:akhder_app/ui/authUi/loginScreen.dart';
import 'package:akhder_app/ui/customWidget/popLoading.dart';
import 'package:akhder_app/ui/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController? phoneController;
  TextEditingController? passwordTextController;
  var isPassHide = true.obs;
  var isPassHideReg = true.obs;
  var isLoading = false.obs;
  var noNetFlage = false.obs;
  late TextEditingController verifyController;

  TextEditingController? nameTextController;
  TextEditingController? phoneRegController;
  TextEditingController? passwordRegTextController;
  // TextEditingController? emailController;
  var selectedcity = "".obs;
  var selectedProv = Map<String, List<String>>().obs;
  // var profile = ProfileModel().obs;
  var needLogin = false.obs;

  late MainRepostary repo;

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordTextController = TextEditingController();
    nameTextController = TextEditingController();
    phoneRegController = TextEditingController();
    passwordRegTextController = TextEditingController();
    verifyController = TextEditingController();
    // emailController = TextEditingController();

    needLogin.value = false;

    repo = MainRepostary();
    // getProfile();
    super.onInit();
  }

  Future<void> loginRequest() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      var playerId = await getuserId();
      final login = await repo.Login(
          "+964" +
              ((phoneController!.text.toString().substring(1))
                  .changeToEngilish()),
          passwordTextController!.text.toString(),
          playerId.toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', login.token);
      await prefs.setString('role', login.role!);
      await prefs.setInt('verify', login.isVerified);

      String token = prefs.getString('token')!;

      print("token    :" + token);
      print("role    :" + prefs.getString('role')!);
      print(
          "player id .. ... .. ....... ...... ..     :" + playerId.toString());

      // final dd = await getProfile();
      Get.back();
      if (login.isVerified == 0) {
        Get.off(PinCodeVerificationScreen("+964" +
            (phoneController!.text
                .toString()
                .changeToEngilish()
                .substring(1))));
      } else {
        Get.delete<LoginController>();
        MainController mainController = Get.put(MainController());
        ProfileController profileController = Get.put(ProfileController());
        CartController cartController = Get.put(CartController());
        OrderController orderController = Get.put(OrderController());
        FavouriteController favController = Get.put(FavouriteController());
        Get.offAll(MainScreen());
      }
      // Get.delete<ItemDetailsController>();

      // MainController mainController = Get.put(MainController());

      // Get.delete<ProfileController>();

      // Get.offAll(MainScreen());
      // Get.dialog(null);
      showSnake("تم تسجيل الدخول بنجاح");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake("يوجد خطأ في الرقم او كلمة المرور");
    }
  }

  Future<void> regesterRequest() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      var playerId = await getuserId();
      final login = await repo.Regester(
          phone: "+964" +
              (phoneRegController!.text
                  .toString()
                  .changeToEngilish()
                  .substring(1)),
          name: nameTextController!.text.toString(),
          password: passwordRegTextController!.text.toString(),
          player_id: playerId.toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', login.token);

      Get.back();
      nameTextController!.clear();
      // phoneRegController!.clear();

      passwordRegTextController!.clear();
      print("login.isVerified .. ... .. ... ..");

      print(login.isVerified);
      if (login.isVerified == 0) {
        Get.off(PinCodeVerificationScreen(
            // login.token,
            "+964" +
                (phoneRegController!.text
                    .toString()
                    .changeToEngilish()
                    .substring(1))));
      } else {
        Get.offAll(LoginScreen());
      }

      // selectedProv.value = null;
      // selectedcity.value = null;

      // Get.snackbar("تم انشاء حساب بنجاح", "تم انشاء حساب بنجاح",
      //     duration: Duration(seconds: 3),
      //     icon: Icon(
      //       Icons.info,
      //       color: Colors.white,
      //     ),
      //     colorText: Colors.white,
      //     backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      Get.snackbar(_.toString(), _.toString(),
          duration: Duration(seconds: 3),
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          colorText: Colors.white,
          backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
    }
  }

  Future<void> verify() async {
    Get.dialog(popUpLoading(), barrierDismissible: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      // var playerId = await getuserId();
      final login =
          await repo.VerifyUser(token!, verifyController.text.toString());
      await prefs.setInt('verify', 1);
      Get.back();
      Get.delete<LoginController>();
      MainController mainController = Get.put(MainController());
      ProfileController profileController = Get.put(ProfileController());
      CartController cartController = Get.put(CartController());
      OrderController orderController = Get.put(OrderController());
      FavouriteController favController = Get.put(FavouriteController());

      // MainController mainController = Get.put(MainController());

      // Get.delete<ProfileController>();

      Get.offAll(MainScreen());
      // Get.offAll(LoginScreen());
      // nameTextController!.clear();
      // phoneRegController!.clear();

      // passwordRegTextController!.clear();
      // selectedProv.value = null;
      // selectedcity.value = null;

      showSnake("تم تأكيد الحساب");
    } on SocketException catch (_) {
      Get.back();
      showSnake(noNet);
    } catch (_) {
      Get.back();
      showSnake(_.toString());
      // showSnake("يوجد خطأ في رمز التفعيل");
    }
  }
  // Future<void> getProfile() async {
  //   needLogin.value = false;
  //   isLoading.value = true;
  //   noNetFlage.value = false;
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();

  //     String? token = await prefs.getString('token');

  //     print(token);
  //     if (token == null) {
  //       needLogin.value = true;
  //     } else {
  //       final login = await repo.getProfile(token);
  //       await prefs.setString('name', login.data!.profile!.name!);
  //       await prefs.setString('phone', login.data!.profile!.phone!);
  //       await prefs.setString('prov', login.data!.profile!.government!);
  //       await prefs.setString('city', login.data!.profile!.city!);
  //       await prefs.setString('email', login.data!.profile!.email!);

  //       profile.value = login;
  //     }
  //     // var playerId = await getuserId();
  //     isLoading.value = false;
  //   } on SocketException catch (_) {
  //     noNetFlage.value = true;

  //     isLoading.value = false;

  //     Get.snackbar(noNet, noNet,
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   } catch (_) {
  //     isLoading.value = false;

  //     Get.snackbar(_.toString(), _.toString(),
  //         duration: Duration(seconds: 3),
  //         icon: Icon(
  //           Icons.info,
  //           color: Colors.white,
  //         ),
  //         colorText: Colors.white,
  //         backgroundColor: Get.theme.primaryColorDark.withOpacity(0.3));
  //   }
  // }
}
