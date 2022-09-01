import 'package:akhder_app/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'getString.dart';

DeletAllCartPop() {
  CartController controller = Get.find();
  var alertStyle = AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,

    descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    alertPadding: EdgeInsets.all(10),

    buttonAreaPadding: EdgeInsets.all(10),
    animationDuration: Duration(milliseconds: 200),

    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),

    alertAlignment: Alignment.center,
  );

  Alert(
      style: alertStyle,
      context: Get.context!,
      image: Icon(
        Icons.info,
        color: Get.theme.primaryColor,
        size: 70,
      ),
      title: "هل تريد تفريغ السلة ؟",
      buttons: [
        DialogButton(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(5),
          onPressed: () {
            // Geolocator.openLocationSettings();
            // Get.back();
          },
          child: InkWell(
            onTap: () {
              controller.deleteAllCart();

              // Get.back();
            },
            child: Container(
              height: 50,
              width: Get.width - 200,
              child: Center(
                child: Text(
                  "حذف الكل",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ).tr(),
              ),
            ),
          ),
        )
      ]).show();
}
