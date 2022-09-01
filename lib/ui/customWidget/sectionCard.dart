import 'package:akhder_app/controllers/mainController.dart';
import 'package:akhder_app/data/mainCategory.dart';
import 'package:akhder_app/ui/customWidget/listWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loadingImage.dart';

class sectionCard extends StatelessWidget {
  MainCategory? item;
  sectionCard(this.item);
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mainController.getShopSingel(item!.id, item!.name);
      },
      child: Container(
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 75,
                height: 75,
                imageUrl: item!.img,
                placeholder: (context, url) => loadinImage(),
                errorWidget: (context, url, error) => loadinImage(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
