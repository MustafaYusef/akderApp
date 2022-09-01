import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/ui/categoryItemsScreen.dart';
import 'package:akhder_app/ui/customWidget/loadingImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget shopCategoryCard(
    ShopDetail item, int shopId, List<ShopDetail> categoryShop) {
  return InkWell(
    onTap: () {
      Get.to(CategoryItemsScreen(shopId, item.id, categoryShop));
    },
    child: Container(
      child: Column(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
                width: 90,
                height: 95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                // "kskdsk",
                                item.name,
                                textAlign: TextAlign.center,

                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,

                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[800],
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 90,
                        imageUrl: item.img,
                        placeholder: (context, url) => loadinImage(),
                        errorWidget: (context, url, error) => loadinImage(),
                      ),
                    ),
                  ],
                )),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
        ],
      ),
    ),
  );
}
