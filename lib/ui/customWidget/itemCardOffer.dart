import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/offersItem.dart';
import 'package:akhder_app/ui/itemDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'loadingImage.dart';

class itemCardOffer extends StatelessWidget {
  Item item;
  itemCardOffer(this.item);
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            ItemDetailsScreen(
              item: item,
              offerPrice: 1200,
              count: 1,
            ),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500));
      },
      child: Container(
        width: Get.width / 2.4,
        // height: 350,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: item.id.toString() + "offer",
                    child: Card(
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.contain,
                            width: Get.width / 2 - 10,
                            height: 185,
                            imageUrl: item.imagePath,
                            placeholder: (context, url) => loadinImage(),
                            errorWidget: (context, url, error) => loadinImage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // width: Get.width / 2 - 10,
                // height: 70,
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1200" + " IQD ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: myRed,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " / حبة",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: myRed,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.price.toString() + " IQD ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          " / حبة",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                height: 1,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => controller.myCart.value
                              .any((e) => e.itemId == item.id)
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 35,
                                    // margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Get.theme.primaryColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.countArray[controller
                                                  .myCart.value
                                                  .indexWhere((e) =>
                                                      e.itemId == item.id)]++;
                                              controller.addCart(
                                                  item.id,
                                                  controller.countArray[
                                                      controller.myCart.value
                                                          .indexWhere((e) =>
                                                              e.itemId ==
                                                              item.id)]);
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Get.theme.primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Get.theme.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Obx(
                                              () => Text(
                                                controller.countArray[controller
                                                        .myCart.value
                                                        .indexWhere((e) =>
                                                            e.itemId ==
                                                            item.id)]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            child: controller.countArray[
                                                        controller.myCart.value
                                                            .indexWhere((e) =>
                                                                e.itemId ==
                                                                item.id)] ==
                                                    1
                                                ? InkWell(
                                                    onTap: () {
                                                      controller
                                                          .deleteCart(item.id);
                                                    },
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Get.theme
                                                              .primaryColor,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      if (controller.countArray[
                                                              controller
                                                                  .myCart.value
                                                                  .indexWhere((e) =>
                                                                      e.itemId ==
                                                                      item.id)] >
                                                          1) {
                                                        controller.countArray[
                                                            controller
                                                                .myCart.value
                                                                .indexWhere((e) =>
                                                                    e.itemId ==
                                                                    item.id)]--;
                                                        controller.addCart(
                                                            item.id,
                                                            controller
                                                                    .countArray[
                                                                controller
                                                                    .myCart
                                                                    .value
                                                                    .indexWhere((e) =>
                                                                        e.itemId ==
                                                                        item.id)]);
                                                      }
                                                    },
                                                    child: Container(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16,
                                                                vertical: 10),
                                                        child: Image.asset(
                                                          "assets/images/remove.png",
                                                          width: 12,
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
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.addCart(item.id, 1);
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Get.theme.primaryColor,
                                          width: 0.3)),
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor
                                          .withOpacity(0.2),
                                      // border: Border.all(color: Get.theme.primaryColor),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/addCart.png",
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "أضف للسلة",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          elevation: 0,

          margin: EdgeInsets.all(2),
        ),
      ),
    );
  }
}
