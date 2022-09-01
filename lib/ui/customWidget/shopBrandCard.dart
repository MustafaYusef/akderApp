import 'package:akhder_app/controllers/shopDetailsController.dart';
import 'package:akhder_app/data/mainCategory.dart';
import 'package:akhder_app/data/shopBrand.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../categoryItemsScreen.dart';
import 'loadingImage.dart';

class shopBrandCard extends StatelessWidget {
  ShopBrand? item;
  shopBrandCard(this.item);
  ShopDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CategoryItemsScreen(item!.shopId, item!.cat_id,
            controller.shopsDetails.value.shopDetails!));
        // print(item!.id);
        // Get.to(SectionsItemScreen(item!.id));
      },
      child: Container(
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                width: 80,
                height: 80,
                imageUrl: item!.img,
                placeholder: (context, url) => loadinImage(),
                errorWidget: (context, url, error) => loadinImage(),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: ),
                child: Text(
                  // "kskdsk",
                  item!.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.normal,
                    color: Colors.black,
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
