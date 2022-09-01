import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:akhder_app/ui/customWidget/loadingImage.dart';
import 'package:akhder_app/ui/shopDetails/shopDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget myShopCard(Shop list) {
  return InkWell(
    onTap: () {
      Get.back();
      Get.to(ShpoDetailsScreen(list));
    },
    child: Container(
      height: 80,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                  imageUrl: list.img,
                  placeholder: (context, url) => loadinImage(),
                  errorWidget: (context, url, error) => loadinImage(),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    list.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "توصيل سريع في اقل من 30 دقيقة",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: Get.width,
            height: 1,
            color: Colors.grey[200],
          )
        ],
      ),
    ),
  );
}
