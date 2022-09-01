import 'package:akhder_app/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'getString.dart';

CloseShopCartPop() {
  var alertStyle = AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    descStyle: TextStyle(
      fontSize: 16,
    ),
    // descTextAlign: TextAlign.start,
    alertPadding: EdgeInsets.all(10),

    buttonAreaPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    animationDuration: Duration(milliseconds: 200),
    buttonsDirection: ButtonsDirection.row,
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleTextAlign: TextAlign.right,
    descTextAlign: TextAlign.right,
    alertAlignment: Alignment.centerRight,
  );

  Alert(
      style: alertStyle,
      context: Get.context!,
      image: Container(),
      title: "المتجر مغلق",
      desc:
          "خدمة التوصيل غير متوفرة من المتجر في الوقت الحالي.ولكن يمكنك تصفح المنتجات أو التسوق في متجر آخر في القائمة",
      buttons: [
        DialogButton(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(5),
          onPressed: () {
            // Geolocator.openLocationSettings();
            // Get.back();
          },
          child: InkWell(
            onTap: () {
              // controller.deleteAllCart();

              Get.back();
              Get.back();
            },
            child: Container(
              height: 50,
              // width: Get.width - 200,
              child: Center(
                child: Text(
                  "رجوع لقائمة المتاجر",
                  style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
          ),
        ),
        DialogButton(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(5),
          onPressed: () {
            // Geolocator.openLocationSettings();
            // Get.back();
          },
          child: InkWell(
            onTap: () {
              // controller.deleteAllCart();

              Get.back();
            },
            child: Container(
              height: 50,
              // width: Get.width - 200,
              child: Center(
                child: Text(
                  "تصفح منتجات المتجر",
                  style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
          ),
        ),
      ]).show();
}
