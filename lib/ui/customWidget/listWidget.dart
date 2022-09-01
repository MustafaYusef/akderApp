import 'package:akhder_app/data/myShopsCategory.dart';
import 'package:akhder_app/ui/customWidget/myShopCard.dart';
import 'package:akhder_app/ui/customWidget/showShopsWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class shopListCard extends StatelessWidget {
  ShopCategoryModel item;
  shopListCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      height: ((90 * (item.count > 3 ? 3 : item.count) + 20) +
              (item.count > 3 ? 105 : 0))
          .toDouble(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              item.mainCategoryName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: item.shops.length > 3 ? 3 : item.shops.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return myShopCard(item.shops[index]);
                }),
          ),
          item.count > 3
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 40,
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      modalBottomSheetMenu(item.shops, item.mainCategoryName);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor.withOpacity(0.1),
                          // border: Border.all(color: Get.theme.primaryColor),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "عرض كل المتاجر (${item.count - 3})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Get.theme.primaryColorDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

void modalBottomSheetMenu(List<Shop> shops, String name) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: Get.context!,
      builder: (builder) {
        return new Container(
            height: Get.height - 50,
            color: Colors.transparent,
            child: areasListWidget(shops, name));
      });
}
