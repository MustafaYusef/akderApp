import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/favouriteController.dart';
import 'package:akhder_app/controllers/orderController.dart';
import 'package:akhder_app/methods/deleteCartPopUp.dart';
import 'package:akhder_app/methods/getString.dart';
import 'package:akhder_app/ui/customWidget/favouriteCard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customWidget/cartCard.dart';
import 'customWidget/loadingImage.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  CartController controller = Get.put(CartController());
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    // controller.getShopItem(catId, shopId);
    return Scaffold(
      backgroundColor: myGrey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          "سلة التسوق",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () {
              DeletAllCartPop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Get.theme.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Container(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  children: [
                    Expanded(
                      child: controller.isLoading.value
                          ? Container(
                              child: Center(
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      child: CircularProgressIndicator())))
                          : Container(
                              child: controller.myCart.isEmpty
                                  ? RefreshIndicator(
                                      onRefresh: () {
                                        return controller.getCart();
                                      },
                                      child: ListView(
                                        children: [
                                          Container(
                                              height: Get.height,
                                              child: Center(
                                                  child:
                                                      Text("لا يوجد بيانات"))),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: Colors.white,
                                      child: RefreshIndicator(
                                        onRefresh: () {
                                          return controller.getCart();
                                        },
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              height: 65,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Colors.grey[300]!,
                                                        blurRadius: 5)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5))),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 55,
                                                    height: 55,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 5),
                                                    child: Card(
                                                      semanticContainer: true,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: controller
                                                            .myCart[0]
                                                            .storeImage,
                                                        placeholder:
                                                            (context, url) =>
                                                                loadinImage(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            loadinImage(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .myCart[0].storeName
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "وقت التوصيل : " +
                                                            controller.myCart[0]
                                                                .deliverDuration
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .grey[800]),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            ListView.builder(
                                              itemCount:
                                                  controller.myCart.length,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return cartCard(
                                                    controller.myCart[index],
                                                    index);
                                              },
                                              scrollDirection: Axis.vertical,
                                              // controller: _scrollController,
                                              // gridDelegate:
                                              //     SliverGridDelegateWithFixedCrossAxisCount(
                                              //   crossAxisCount: 2,
                                              //   childAspectRatio:
                                              //       (Get.width / 2) / 310,
                                              //   // crossAxisSpacing: 5.0,
                                              //   // mainAxisSpacing: 5.0,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => controller.myCart.isEmpty
                  ? Container()
                  : Container(
                      width: Get.width,
                      height: 85,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey[300]!, blurRadius: 5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5))),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "سعر المنتجات",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                // Expanded(child: Container()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.sumCart.value.toString() +
                                      " " +
                                      "د.ع",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Get.theme.primaryColor),
                              height: 50,
                              // width: Get.width,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: RaisedButton(
                                    color: Get.theme.primaryColor,
                                    onPressed: () async {
                                      orderController.makeOrder();
                                    },
                                    child: Text(
                                      "تابع عملية الشراء",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      )),
    );
  }
}
