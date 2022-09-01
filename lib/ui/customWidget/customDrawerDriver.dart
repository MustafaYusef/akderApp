import 'package:akhder_app/controllers/driverControllers/orderDriverController.dart';
import 'package:akhder_app/controllers/profileController.dart';
import 'package:akhder_app/methods/methods.dart';
import 'package:akhder_app/ui/authUi/loginScreen.dart';
import 'package:akhder_app/ui/driver/driverCurrentOrderScreen.dart';
import 'package:akhder_app/ui/driver/driverTaskOrderScreen.dart';
import 'package:akhder_app/ui/driver/qrSearchScreen.dart';
import 'package:akhder_app/ui/favouriteScreen.dart';
import 'package:akhder_app/ui/clientOrder/orderScreen.dart';
import 'package:akhder_app/ui/vendor/vendorCurrentOrderScreen.dart';
import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../cartScreen.dart';
import '../driver/archiveOrderScreen.dart';
import 'logoutPopUp.dart';

class drawarDriver extends StatefulWidget {
  int index;
  // int notifNum=0;
  //  int cartNum=0;
  drawarDriver({required this.index});

  @override
  _drawarDriverState createState() => _drawarDriverState();
}

class _drawarDriverState extends State<drawarDriver> {
  String name = "";

  String role = "";
  double distance = 0;
  ProfileController profileController = Get.put(ProfileController());
  int notifNum = 0;
  int cartNum = 0;
  // final UploadOfflineController _uploadController =
  //     Get.put(UploadOfflineController());
  // @override
  // void initState() {
  //   // _uploadController.getCount();
  //   super.initState();
  //   getImage();
  // }

  // getImage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     role = prefs.getString('role');
  //     distance = prefs.getDouble('distance');
  //   });
  // }

  // final OfflineController _collController = Get.put(OfflineController());
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (cont) {
      return Drawer(
        child: Container(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          color: Get.theme.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 160,
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(60)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      "assets/images/person_logo.png",
                                      // height: 100,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => profileController.needLogin.value
                                    ? Container(
                                        // margin: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          "سجل الدخول / إنشاء حساب",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        // margin: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          profileController.profile.value.name
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          )),
                      // Container(
                      //   color: Colors.white,
                      //   child: ListTile(
                      //     onTap: () {
                      //       // Scaffold.of(cont).openEndDrawer();
                      //     },
                      //     selected: widget.index == 0 ? true : false,
                      //     title: Text("الرئيسية",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.grey[600],
                      //         )).tr(),
                      //     leading: Icon(
                      //       Icons.home,
                      //       color: Colors.grey[600],
                      //       size: 25,
                      //     ),
                      //   ),
                      // ),
                      // Divider(
                      //   height: 0.5,
                      //   color: Colors.white,
                      // ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () async {
                            Scaffold.of(cont).openEndDrawer();
                            Get.to(DriverTaskOrderScreen());
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("الطلبات قيد التوصيل",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.list,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () async {
                            Scaffold.of(cont).openEndDrawer();
                            Get.to(DriverArchiveOrderScreen());
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("الطلبات السابقة",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.list,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      // Container(
                      //   color: Colors.white,
                      //   child: ListTile(
                      //     onTap: () {
                      //       Scaffold.of(cont).openEndDrawer();
                      //     },
                      //     selected: widget.index == 0 ? true : false,
                      //     title: Text("حسابي",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.grey[600],
                      //         )).tr(),
                      //     leading: Icon(
                      //       Icons.person,
                      //       color: Colors.grey[600],
                      //       size: 25,
                      //     ),
                      //   ),
                      // ),
                      // Divider(
                      //   height: 0.5,
                      //   color: Colors.white,
                      // ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Scaffold.of(cont).openEndDrawer();
                            Get.to(QrSearchScreen());
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("إضافة اشتراك",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.qr_code_scanner_rounded,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          onTap: () async {
                            Scaffold.of(cont).openEndDrawer();
                            LogoutPopUp();
                          },
                          selected: widget.index == 0 ? true : false,
                          title: Text("تسجيل خروج",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              )).tr(),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height - 200,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}
