import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/favouriteController.dart';
import 'package:akhder_app/controllers/itemDetailsController.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/ui/cartScreen.dart';
import 'package:akhder_app/ui/customWidget/loadingImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDetailsScreen extends StatelessWidget {
  Item? item;
  int? offerPrice;
  int? count;
  ItemDetailsScreen({this.item, this.offerPrice, this.count}) {
    print(count);
    controller.count.value = count!;
    print("cartController.count.value");
    print(cartController.count.value);
  }
  ItemDetailsController controller = Get.put(ItemDetailsController());

  //   print(id);
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   c
  //   // getCart();
  // }
  CartController cartController = Get.find();

  int cart = 0;

  @override
  Widget build(BuildContext context) {
    // FavouriteController favouriteController = Get.put(FavouriteController());
    // controller.itemId.value = item!.id;
    FavouriteController favController = Get.find();
    // controller.image.value = image!;
    // controller.getMain(id);
    // favController.getFavourite();
    Future<bool> _willPop() async {
      Get.delete<ItemDetailsController>();
      Get.back();
      return true;
    }

    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Obx(
          () => Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    bottom: cartController.myCart.isEmpty ? 0 : 70),
                child: Column(
                  children: [
                    Container(
                      child: Expanded(
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView(
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        // Get.to(ImagesScreenDetails(controller: controller));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Hero(
                                          tag: item!.id.toString() +
                                              (offerPrice != null
                                                  ? "offer"
                                                  : ""),
                                          child: Card(
                                            semanticContainer: true,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            elevation: 0,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: Get.height / 2 + 100,
                                              imageUrl: item!.imagePath,
                                              placeholder: (context, url) =>
                                                  loadinImage(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      loadinImage(),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    top: 15.0,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.delete<ItemDetailsController>();

                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 10,
                                                top: 15,
                                                left: 10,
                                                bottom: 5),
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Icon(Icons.close,
                                                    color:
                                                        Get.theme.primaryColor,
                                                    size: 30)),
                                          ),
                                        ),
                                        Obx(
                                          () => Padding(
                                            padding: EdgeInsets.only(
                                                right: 10, top: 15, left: 10),
                                            child: controller.needLogin.value
                                                ? Container()
                                                : InkWell(
                                                    onTap: () async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();

                                                      String? token =
                                                          await prefs.getString(
                                                              'token');
                                                      if (token != null) {
                                                        int id = 0;
                                                        if (favController
                                                            .myFavourite.value
                                                            .any((e) =>
                                                                e.id ==
                                                                item!.id)) {
                                                          print("yes");
                                                          id = favController
                                                              .myFavourite.value
                                                              .indexWhere((e) =>
                                                                  e.id ==
                                                                  item!.id)
                                                              .toInt();
                                                          print(id);
                                                          favController
                                                              .deleteFavourite(
                                                                  item!.id);
                                                        } else {
                                                          print("no");

                                                          favController
                                                              .addFavourite(
                                                                  item!.id);
                                                        }
                                                      } else {
                                                        Get.snackbar(
                                                            "يجب تسجيل الدخول",
                                                            "يجب تسجيل الدخول",
                                                            duration: Duration(
                                                                seconds: 3),
                                                            icon: Icon(
                                                              Icons.info,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            colorText:
                                                                Colors.white,
                                                            backgroundColor: Get
                                                                .theme
                                                                .primaryColorDark
                                                                .withOpacity(
                                                                    0.3));
                                                      }
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          22.5)),
                                                          color: Colors.grey),
                                                      width: 40,
                                                      height: 40,
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.favorite,
                                                        color: favController
                                                                .myFavourite
                                                                .value
                                                                .any((e) =>
                                                                    e.id ==
                                                                    item!.id)
                                                            ? Colors.red
                                                            : Colors.white,
                                                        size: 27,
                                                      )),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        item!.name,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 18,
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: offerPrice == null
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  item!.price.toString() +
                                                      " IQD ",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " / حبة",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      offerPrice.toString() +
                                                          " IQD ",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: myRed,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      " / حبة",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: myRed,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      item!.price.toString() +
                                                          " IQD ",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Text(
                                                      " / حبة",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        item!.description,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  width: Get.width,
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight:
                                              const Radius.circular(10.0))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(
                                        () =>
                                            cartController.myCart.value.any(
                                                    (e) => e.itemId == item!.id)
                                                ? Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 45,
                                                          // margin: EdgeInsets.symmetric(horizontal: 5),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Get.theme
                                                                    .primaryColor
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    cartController.countArray[cartController
                                                                        .myCart
                                                                        .value
                                                                        .indexWhere((e) =>
                                                                            e.itemId ==
                                                                            item!.id)]++;
                                                                    cartController.addCart(
                                                                        item!
                                                                            .id,
                                                                        cartController.countArray[cartController
                                                                            .myCart
                                                                            .value
                                                                            .indexWhere((e) =>
                                                                                e.itemId ==
                                                                                item!.id)]);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              16,
                                                                          vertical:
                                                                              10),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Get
                                                                            .theme
                                                                            .primaryColor,
                                                                        size:
                                                                            23,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Get
                                                                          .theme
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  child: Obx(
                                                                    () => Text(
                                                                      cartController
                                                                          .countArray[cartController
                                                                              .myCart
                                                                              .value
                                                                              .indexWhere((e) => e.itemId == item!.id)]
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Container(
                                                                  child: cartController.countArray[cartController
                                                                              .myCart
                                                                              .value
                                                                              .indexWhere((e) => e.itemId == item!.id)] ==
                                                                          1
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () {
                                                                            cartController.deleteCart(item!.id);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                                                              child: Icon(
                                                                                Icons.delete,
                                                                                color: Get.theme.primaryColor,
                                                                                size: 23,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : InkWell(
                                                                          onTap:
                                                                              () {
                                                                            if (cartController.countArray[cartController.myCart.value.indexWhere((e) => e.itemId == item!.id)] >
                                                                                1) {
                                                                              cartController.countArray[cartController.myCart.value.indexWhere((e) => e.itemId == item!.id)]--;
                                                                              cartController.addCart(item!.id, cartController.countArray[cartController.myCart.value.indexWhere((e) => e.itemId == item!.id)]);
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                                                              child: Image.asset(
                                                                                "assets/images/remove.png",
                                                                                width: 15,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.white),
                                                    height: 45,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        cartController.addCart(
                                                            item!.id, 1);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 1,
                                                        primary: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            side: BorderSide(
                                                                color: Get.theme
                                                                    .primaryColor,
                                                                width: 0.3)),
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                      ),
                                                      child: Ink(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Get.theme
                                                                    .primaryColor,
                                                                // border: Border.all(color: Get.theme.primaryColor),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "أضف للسلة",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 17,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                      )
                                      // countWidget(item!)
                                      // // controller.isAddToCart.value
                                      // //     ? countWidget(controller, item!)
                                      // //     :
                                      // ,
                                      // Container(
                                      //     margin: EdgeInsets.symmetric(
                                      //         vertical: 5, horizontal: 10),
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(5),
                                      //         color: Get.theme.primaryColor),
                                      //     height: 50,
                                      //     width: Get.width,
                                      //     child: ClipRRect(
                                      //         borderRadius: BorderRadius.circular(30),
                                      //         child: Padding(
                                      //           padding: const EdgeInsets.all(1.0),
                                      //           child: RaisedButton(
                                      //             color: Get.theme.primaryColor,
                                      //             onPressed: () async {
                                      //               SharedPreferences prefs =
                                      //                   await SharedPreferences
                                      //                       .getInstance();

                                      //               String? token = await prefs
                                      //                   .getString('token');
                                      //               if (token == null) {
                                      //                 logOut();
                                      //               } else {
                                      //                 cartController.addCart(item!.id,
                                      //                     controller.count.value);
                                      //               }
                                      //             },
                                      //             child: Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment.center,
                                      //               children: [
                                      //                 Icon(
                                      //                   Icons.add,
                                      //                   color: Colors.white,
                                      //                   size: 22,
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 10,
                                      //                 ),
                                      //                 Text(
                                      //                   "أضف للسلة",
                                      //                   style: TextStyle(
                                      //                       color: Colors.white,
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                       fontSize: 16),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ))),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          height: 70,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500]!, blurRadius: 6)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "لديك منتجات في السلة",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Get.theme.primaryColor),
                                height: 50,
                                width: 150,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
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
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            decoration: BoxDecoration(
                                                color: Colors.teal[900],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              cartController.myCart.length
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
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
}

// Future<bool> onLikeButtonTapped(bool isLiked) async {
//   FavouriteController controller = Get.find();
//   controller.addFavourite();
//   return !isLiked;
// }

// Widget favouriteButton() {
//   return ;
// }

class countWidget extends StatelessWidget {
  ItemDetailsController controller = Get.find();
  Item item;
  countWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.count.value++;
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                  child: Icon(
                    Icons.add,
                    color: Get.theme.primaryColor,
                    size: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Obx(
                () => Text(
                  controller.count.value.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                if (controller.count.value > 1) {
                  controller.count.value--;
                }
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Image.asset(
                    "assets/images/remove.png",
                    width: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
