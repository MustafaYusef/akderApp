import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/shopDetailsController.dart';
import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:akhder_app/ui/cartScreen.dart';
import 'package:akhder_app/ui/customWidget/itemCardAllOffer.dart';
import 'package:akhder_app/ui/customWidget/itemCardOffer.dart';
import 'package:akhder_app/ui/customWidget/itemCardTop.dart';
import 'package:akhder_app/ui/customWidget/loadingImage.dart';
import 'package:akhder_app/ui/customWidget/shopBrandCard.dart';
import 'package:akhder_app/ui/customWidget/shopCategoryCard.dart';
import 'package:akhder_app/ui/searchScreen.dart';
import 'package:akhder_app/ui/shopDetails/sliderShop.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../methods/closeShopPopUp.dart';
import '../../methods/deleteCartPopUp.dart';

class ShpoDetailsScreen extends StatelessWidget {
  Shop shopId;
  ShopDetailsController controller = Get.put(ShopDetailsController());
  CartController cartController = Get.find();
  ShpoDetailsScreen(this.shopId) {
    controller.isClose.value = shopId.IsClosed;
    controller.getShopDetails(shopId.id);
  }
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPop() async {
      Get.delete<ShopDetailsController>();
      Get.back();
      return true;
    }

    // if (shopId.IsClosed == 0) {
    //   CloseShopCartPop();
    // }
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        backgroundColor: myGrey,
        body: Obx(
          () => controller.isCategoryLoading.value
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: cartController.myCart.isEmpty ? 0 : 70),
                      child: NestedScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxScrolled) {
                          return <Widget>[
                            createSilverAppBar1(controller),
                            createSilverAppBar2(controller)
                          ];
                        },
                        body: controller.shopsDetails.value.shopDetails == null
                            ? Container(
                                height: 200,
                                width: Get.width,
                                child: Center(child: Text("لا توجد بيانات")))
                            : ListView(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 10),
                                    child: Obx(
                                      () => controller.sliderLoading.value
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
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Card(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                          : Container(
                                              child: controller
                                                      .shopSlider.value.isEmpty
                                                  ? Container()
                                                  : sliderShop(
                                                      current: _current,
                                                      banners: controller
                                                          .shopSlider.value,
                                                    ),
                                            ),
                                    ),
                                  ),
                                  Obx(
                                    () => Wrap(
                                      spacing: 5,
                                      alignment: WrapAlignment.center,
                                      children: listCategory(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => Container(
                                      color: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      height: 175,
                                      width: Get.width,
                                      child: controller.brandLoading.value
                                          ? Container(
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Container(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: myGrey,
                                                  enabled: true,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 45),
                                                    child: ListView.builder(
                                                        itemCount: 10,
                                                        shrinkWrap: true,
                                                        reverse: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Card(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                            ),
                                                            child: Container(
                                                              width: 70,
                                                              height: 70,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              child:
                                                  controller.shopBrands.isEmpty
                                                      ? Container()
                                                      : Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  child: Text(
                                                                    "أشهر العلامات التجارية",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              height: 120,
                                                              child: ListView
                                                                  .builder(
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      itemCount: controller
                                                                          .shopBrands
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return shopBrandCard(
                                                                            controller.shopBrands[index]);
                                                                      }),
                                                            ),
                                                          ],
                                                        ),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => Container(
                                      color: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      // height: 390,
                                      width: Get.width,
                                      child: controller.isOfferLoading.value
                                          ? Container(
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Container(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: myGrey,
                                                  enabled: true,
                                                  child: Container(
                                                    height: 200,
                                                    margin: EdgeInsets.only(
                                                        bottom: 45),
                                                    child: ListView.builder(
                                                        itemCount: 10,
                                                        shrinkWrap: true,
                                                        reverse: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Card(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Container(
                                                              width: 180,
                                                              height: 200,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        "أخر العروض",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 310,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: controller
                                                          .topFiveItem.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return itemCardOffer(
                                                            controller
                                                                    .topFiveItem[
                                                                index]);
                                                      }),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => Container(
                                      color: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      height: 390,
                                      width: Get.width,
                                      child: controller.topFiveLoading.value
                                          ? Container(
                                              // height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Container(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: myGrey,
                                                  enabled: true,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 45),
                                                    child: ListView.builder(
                                                        itemCount: 10,
                                                        shrinkWrap: true,
                                                        reverse: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Card(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Container(
                                                              width: 180,
                                                              height: 200,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        "منتجات مقترحة",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 310,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: controller
                                                          .topFiveItem.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return itemCardTop(
                                                            controller
                                                                    .topFiveItem[
                                                                index]);
                                                      }),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Obx(
                        () => cartController.myCart.isEmpty
                            ? Container()
                            : Container(
                                width: Get.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[500]!,
                                          blurRadius: 6)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "لديك منتجات في السلة",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Get.theme.primaryColor),
                                      height: 40,
                                      // width: 150,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: RaisedButton(
                                            color: Get.theme.primaryColor,
                                            onPressed: () async {
                                              Get.to(CartScreen());
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "عرض السلة",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                      color: Colors.teal[900],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Text(
                                                    cartController.myCart.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  List<Widget> listCategory() {
    var list = <Widget>[];
    for (var i = 0;
        i < (controller.shopsDetails.value.shopDetails!.length);
        i++) {
      list.add(shopCategoryCard(controller.shopsDetails.value.shopDetails![i],
          shopId.id, controller.shopsDetails.value.shopDetails!));
    }
    return list;
  }

  SliverAppBar createSilverAppBar1(ShopDetailsController controller) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 225,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: myGrey,
            child: Column(
              children: [
                Container(
                  height: 220,
                  child: controller.shopsDetails.value.shopOption == null
                      ? Container(
                          height: 100,
                        )
                      : Stack(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: Get.width,
                              height: 70,
                              imageUrl: controller
                                  .shopsDetails.value.shopOption!.img
                                  .toString(),
                              placeholder: (context, url) => loadinImage(),
                              errorWidget: (context, url, error) =>
                                  loadinImage(),
                            ),
                            Positioned(
                              bottom: 110,
                              left: 10,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 65,
                                  height: 65,
                                  imageUrl: controller
                                      .shopsDetails.value.shopOption!.img,
                                  placeholder: (context, url) => loadinImage(),
                                  errorWidget: (context, url, error) =>
                                      loadinImage(),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 2,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(
                                      top: 0, right: 20, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          controller
                                              .shopsDetails.value.shopName!,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.shopping_bag,
                                              size: 16,
                                              color: Colors.grey[500]),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text("الحد الأدنى : ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                          Text(
                                              controller.shopsDetails.value
                                                      .shopOption!.minReqAmount
                                                      .toString() +
                                                  " IQD",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.delivery_dining_outlined,
                                              size: 16,
                                              color: Colors.grey[500]),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("رسوم التوصيل : ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                          Text(
                                              controller.shopsDetails.value
                                                      .shopOption!.deliverFees
                                                      .toString() +
                                                  " IQD",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.lock_clock,
                                              size: 16,
                                              color: Colors.grey[500]),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text("التوصيل خلال : ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                          Text(
                                              controller
                                                      .shopsDetails
                                                      .value
                                                      .shopOption!
                                                      .deliverDuration
                                                      .toString() +
                                                  " دقيقة ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[800])),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2(ShopDetailsController controller) {
    return SliverAppBar(
      elevation: 0,
      toolbarHeight: 50,

      // expandedHeight: 60,
      backgroundColor: myGrey,

      pinned: true,
      iconTheme: IconThemeData(color: Colors.black),
      // automaticallyImplyLeading: false,

      title: InkWell(
        onTap: () {
          Get.to(SearchScreen(shopId.id));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 45,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                  ),
                ),
                Expanded(
                  child: Text(
                    "البحث في المتجر",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    "assets/images/barcode.png",
                    width: 30,
                    height: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
