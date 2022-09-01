import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/favouriteController.dart';
import 'package:akhder_app/controllers/mainController.dart';
import 'package:akhder_app/controllers/orderController.dart';
import 'package:akhder_app/controllers/profileController.dart';
import 'package:akhder_app/controllers/vendorControllers/stockVendorController.dart';
import 'package:akhder_app/ui/customWidget/customDrawer.dart';
import 'package:akhder_app/ui/customWidget/listWidget.dart';
import 'package:akhder_app/ui/customWidget/myShopCard.dart';
import 'package:akhder_app/ui/customWidget/sectionCard.dart';
import 'package:akhder_app/ui/customWidget/shopCategoryCard.dart';
import 'package:akhder_app/ui/customWidget/stockItemCard.dart';
import 'package:akhder_app/ui/sliderSection.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import 'customWidget/cartCard.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  int _current = 0;
  MainController mainController = Get.put(MainController());
  // FavouriteController favouriteController = Get.put(FavouriteController());
  // ItemDetailsController cartController = Get.put(ItemDetailsController());
  // var list = [
  //   {"image": "assets/images/groc.jpeg", "name": "البقالة"},
  //   {"image": "assets/images/marke.jpeg", "name": "سوبر ماركت"},
  //   {"image": "assets/images/marke.jpeg", "name": "المتاجر الجديدة"},
  //   {"image": "assets/images/marke.jpeg", "name": "بطاقات شحن"},
  //   {"image": "assets/images/marke.jpeg", "name": "اسواق الجملة"}
  // ];
  ScrollController listController = ScrollController();
  FavouriteController controller = Get.put(FavouriteController());
  CartController cartController = Get.put(CartController());
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    // listController
    //   ..addListener(() {
    //     // print("lisyt s,m,dms ..........   ");
    //     // print(listController.offset);
    //     if (listController.offset < mainController.conH.value) {
    //       if (listController.offset < 60) {
    //         mainController.conH.value = 100;
    //       } else {
    //         listController.animateTo(0,
    //             duration: Duration(milliseconds: 200), curve: Curves.ease);
    //         mainController.conH.value = 0;
    //       }
    //     }
    //   });
    return Scaffold(
        drawer: drawar(
          index: 0,
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            // centerTitle: true,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),

            backgroundColor: myGrey,
            title: Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              child: Image.asset(
                "assets/images/akderLogo.png",
                width: 200,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            // leading: Container(
            //   margin: EdgeInsets.all(5),
            //   padding: EdgeInsets.only(right: 5, top: 8, left: 5),
            //   child: Container(
            //       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            //       decoration: BoxDecoration(
            //           color: Color(0xff080808),
            //           borderRadius: BorderRadius.circular(10)),
            //       child: Icon(
            //         Icons.call_outlined,
            //         color: Colors.white,
            //         size: 25,
            //       )),
            // ),
            // actions: [
            //   Container(
            //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //     decoration: BoxDecoration(
            //         color: myGrey, borderRadius: BorderRadius.circular(10)),
            //     child: Badge(
            //       badgeContent: Text(
            //         "4",
            //         style: TextStyle(color: Colors.white, fontSize: 10),
            //       ),
            //       position: BadgePosition.topStart(),
            //       badgeColor: Colors.deepOrange,
            //       child: Icon(
            //         Icons.notifications_outlined,
            //         color: Colors.black,
            //         size: 25,
            //       ),
            //     ),
            //   ),
            // ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return mainController.getMain();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    controller: listController,
                    children: [
                      Obx(
                        () => AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          color: myGrey,
                          width: Get.width,
                          height: mainController.conH.value,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "أهلاً بالزائر ",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("ماذا تريد أن تطلب؟",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 120,
                          width: Get.width,
                          child: mainController.isLoadingMainCategory.value
                              ? Container(
                                  // height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: myGrey,
                                      enabled: true,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 45),
                                        child: ListView.builder(
                                            itemCount: 10,
                                            shrinkWrap: true,
                                            reverse: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Container(
                                                  width: 80,
                                                  height: 80,
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      mainController.mainCategoryList.length,
                                  itemBuilder: (context, index) {
                                    return sectionCard(
                                        mainController.mainCategoryList[index]);
                                  }),
                        ),
                      ),
                      Container(
                        color: Colors.white,

                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => mainController.bannersLoading.value
                              ? Container(
                                  width: Get.width,
                                  height: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: myGrey,
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 125,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : sliderSection(
                                  current: _current,
                                  banners: mainController.mainBanners,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,

                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => mainController.bannersLoading.value
                              ? Container(
                                  width: Get.width,
                                  height: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: myGrey,
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 125,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : sliderSection(
                                  current: _current,
                                  banners: mainController.mainBanners2,
                                ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,

                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => mainController.bannersLoading.value
                              ? Container(
                                  width: Get.width,
                                  height: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: myGrey,
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 125,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : sliderSection(
                                  current: _current,
                                  banners: mainController.mainBanners3,
                                ),
                        ),
                      ),
                      Container(
                        color: Colors.white,

                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => mainController.bannersLoading.value
                              ? Container(
                                  width: Get.width,
                                  height: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: myGrey,
                                    enabled: true,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          itemCount: 4,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: Get.width,
                                                height: 125,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : sliderSection(
                                  current: _current,
                                  banners: mainController.mainBanners4,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10),
                      //       child: Text(
                      //         "المتاجر القريبة منك",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Obx(
                      //   () => mainController.nearLoading.value
                      //       ? Container(
                      //           width: Get.width,
                      //           height: 120,
                      //           child: Shimmer.fromColors(
                      //             baseColor: Colors.grey[300]!,
                      //             highlightColor: myGrey,
                      //             enabled: true,
                      //             child: Container(
                      //               margin: EdgeInsets.all(5),
                      //               child: ListView.builder(
                      //                   itemCount: 4,
                      //                   shrinkWrap: true,
                      //                   reverse: true,
                      //                   // scrollDirection: Axis.horizontal,
                      //                   itemBuilder: (context, index) {
                      //                     return Card(
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                       ),
                      //                       child: Container(
                      //                         width: Get.width,
                      //                         height: 125,
                      //                       ),
                      //                     );
                      //                   }),
                      //             ),
                      //           ),
                      //         )
                      //       : Container(
                      //           color: myGrey,
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //               Container(
                      //                 child: ListView.builder(
                      //                     physics:
                      //                         NeverScrollableScrollPhysics(),
                      //                     shrinkWrap: true,
                      //                     itemCount:
                      //                         mainController.nearShops.length,
                      //                     scrollDirection: Axis.vertical,
                      //                     itemBuilder: (context, index) {
                      //                       return myShopCard(mainController
                      //                           .nearShops[index]);
                      //                     }),
                      //               )
                      //               // Container(
                      //               //   margin: EdgeInsets.only(right: 10),
                      //               //   height: 110,
                      //               //   width: Get.width,
                      //               //   child: ListView.builder(
                      //               //       itemCount: mainController.shopsDetails
                      //               //           .value.shopDetails!.length,
                      //               //       scrollDirection: Axis.horizontal,
                      //               //       itemBuilder: (context, index) {
                      //               //         return shopCategoryCard(
                      //               //             mainController.shopsDetails.value
                      //               //                 .shopDetails![index],
                      //               //             mainController.shopsDetails.value
                      //               //                 .shopOption!.id,
                      //               //             mainController.shopsDetails.value
                      //               //                 .shopDetails!);
                      //               //       }),
                      //               // ),
                      //             ],
                      //           ),
                      //         ),
                      // ),
                      // Obx(
                      //   () => mainController.shopsList.value.isEmpty
                      //       ? Container(
                      //           width: Get.width,
                      //           height: 120,
                      //           child: Shimmer.fromColors(
                      //             baseColor: Colors.grey[300]!,
                      //             highlightColor: myGrey,
                      //             enabled: true,
                      //             child: Container(
                      //               margin: EdgeInsets.all(5),
                      //               child: ListView.builder(
                      //                   itemCount: 4,
                      //                   shrinkWrap: true,
                      //                   reverse: true,
                      //                   // scrollDirection: Axis.horizontal,
                      //                   itemBuilder: (context, index) {
                      //                     return Card(
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                       ),
                      //                       child: Container(
                      //                         width: Get.width,
                      //                         height: 125,
                      //                       ),
                      //                     );
                      //                   }),
                      //             ),
                      //           ),
                      //         )
                      //       : Container(
                      //           width: Get.width,
                      //           color: myGrey,
                      //           // height: Get.height,
                      //           child: ListView.builder(
                      //               scrollDirection: Axis.vertical,
                      //               shrinkWrap: true,
                      //               physics: NeverScrollableScrollPhysics(),

                      //               // physics: FixedExtentScrollPhysics(),
                      //               itemCount: mainController.shopsList.length,
                      //               // scrollDirection: Axis.horizontal,
                      //               itemBuilder: (context, index) {
                      //                 return shopListCard(
                      //                     mainController.shopsList[index]);
                      //               }),
                      //         ),
                      // )
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   // height: 300,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 5),
                      //         child: Text(
                      //           "السوبرماركت",
                      //           overflow: TextOverflow.ellipsis,
                      //           maxLines: 1,
                      //           style: TextStyle(
                      //               fontSize: 22,
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //       ListView.builder(
                      //           // shrinkWrap: true,
                      //           physics: ClampingScrollPhysics(),
                      //           shrinkWrap: true,
                      //           itemCount: 5,
                      //           scrollDirection: Axis.vertical,
                      //           itemBuilder: (context, index) {
                      //             return getWidgett(list[0]);
                      //           }),
                      //       Container(
                      //         margin: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 10),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.white),
                      //         height: 45,
                      //         width: Get.width,
                      //         child: ElevatedButton(
                      //           onPressed: () {
                      //             // Get.to(RegesterScreen());
                      //           },
                      //           style: ElevatedButton.styleFrom(
                      //             elevation: 1,
                      //             primary: Colors.white,
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(20.0)),
                      //             padding: EdgeInsets.all(0.0),
                      //           ),
                      //           child: Ink(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.green[300]!.withOpacity(0.1),
                      //                 // border: Border.all(color: Get.theme.primaryColor),
                      //                 borderRadius: BorderRadius.circular(20.0)),
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               child: Text(
                      //                 "عرض كل المتاجر (4)",
                      //                 textAlign: TextAlign.center,
                      //                 style: TextStyle(
                      //                     color: Colors.green[300], fontSize: 18),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // Widget getWidgett(Map<String, String> list) {
  //   return Container(
  //     // height: 200,
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Card(
  //           semanticContainer: true,
  //           clipBehavior: Clip.antiAliasWithSaveLayer,
  //           child: Container(
  //               width: 60,
  //               height: 60,
  //               child: Image.asset(
  //                 "assets/images/marke.jpeg",
  //                 fit: BoxFit.cover,
  //               )),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(50),
  //           ),
  //           elevation: 2,
  //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "بقالة النعناع",
  //               overflow: TextOverflow.ellipsis,
  //               maxLines: 1,
  //               style: TextStyle(
  //                   fontSize: 20,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               "توصيل سريع في اقل من 30 دقيقة",
  //               overflow: TextOverflow.ellipsis,
  //               maxLines: 1,
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.grey[800],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Expanded(child: Container()),
  //         Container(
  //           margin: EdgeInsets.symmetric(horizontal: 10),
  //           child: Icon(
  //             Icons.arrow_forward_ios,
  //             size: 18,
  //             color: Colors.grey[800],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
