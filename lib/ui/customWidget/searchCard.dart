import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/searchItem.dart';
import 'package:akhder_app/ui/itemDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'loadingImage.dart';

class searchCard extends StatelessWidget {
  Result item;
  searchCard(this.item);
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            ItemDetailsScreen(
              item: Item(
                catId: item.catId,
                description: item.description,
                name: item.name,
                id: item.id,
                storeId: item.storeId,
                imagePath: item.imagePath,
                price: item.price,
                createdAt: null,
                updatedAt: null,
              ),
              count: 1,
              offerPrice: null,
            ),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500));
      },
      child: Container(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Stack(
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
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.contain,
                            width: Get.width / 2 - 10,
                            height: 200,
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
                          item.price.toString() + " IQD ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " / حبة",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      height: 40,
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
                                  color: Get.theme.primaryColor, width: 0.3)),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: Get.theme.primaryColor.withOpacity(0.2),
                              // border: Border.all(color: Get.theme.primaryColor),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
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
