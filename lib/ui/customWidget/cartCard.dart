import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/data/cartModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/ui/itemDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'loadingImage.dart';

class cartCard extends StatelessWidget {
  UserBasket item;
  int index;
  cartCard(this.item, this.index);
  CartController controller = Get.find();
  void deleteItem(BuildContext contex) {
    controller.deleteCart(item.itemId);
  }
// void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            ItemDetailsScreen(
                item: Item(
                    catId: 0,
                    createdAt: null,
                    description: "",
                    id: item.itemId,
                    imagePath: item.itemImage,
                    name: item.name,
                    price: item.price,
                    storeId: 0,
                    updatedAt: null),
                offerPrice: null,
                count: controller.countArray[index]),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500));
      },
      child: Slidable(
        key: const ValueKey(0),

        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          // dismissible: DismissiblePane(onDismissed: () {}),
          // extentRatio: ,
          extentRatio: 0.40,

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: deleteItem,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          extentRatio: 0.40,
          motion: ScrollMotion(),
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: deleteItem,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),

        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: item.id.toString(),
                  child: Card(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 120,
                      height: 130,
                      imageUrl: item.itemImage,
                      placeholder: (context, url) => loadinImage(),
                      errorWidget: (context, url, error) => loadinImage(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Container(
                    // width: Get.width / 2 - 10,
                    // height: 70,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
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
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              " / حبة",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                // margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.countArray[index]++;
                                          controller.addCart(item.itemId,
                                              controller.countArray[index]);
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                            child: Icon(
                                              Icons.add,
                                              color: Get.theme.primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
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
                                            controller.countArray[index]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: controller.countArray[index] == 1
                                            ? InkWell(
                                                onTap: () {
                                                  controller
                                                      .deleteCart(item.itemId);
                                                },
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 0),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Get
                                                          .theme.primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .countArray[index] >
                                                      1) {
                                                    controller
                                                        .countArray[index]--;
                                                    controller.addCart(
                                                        item.itemId,
                                                        controller
                                                            .countArray[index]);
                                                  }
                                                },
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              (item.price * controller.countArray[index])
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
