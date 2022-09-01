import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/categoryItemsController.dart';
import 'package:akhder_app/controllers/shopDetailsController.dart';
import 'package:akhder_app/data/shopDetails.dart';
import 'package:akhder_app/methods/getString.dart';
import 'package:akhder_app/ui/cartScreen.dart';
import 'package:akhder_app/ui/customWidget/itemCardAllOffer.dart';
import 'package:akhder_app/ui/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customWidget/noNetWidget.dart';

class CategoryItemsScreen extends StatelessWidget {
  int shopId;
  int catId;
  List<ShopDetail>? shopCategory;
  CategoryItemsScreen(this.shopId, this.catId, this.shopCategory);
  // ShopDetailsController controller1 = Get.put(ShopDetailsController());
  CartController cartController = Get.find();
  CategoryItemsController controller = Get.put(CategoryItemsController());
  @override
  Widget build(BuildContext context) {
    controller.id.value = catId;

    controller.getShopItem(catId, shopId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Get.theme.primaryColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 3),
                child: CupertinoTextField(
                  // controller: _filter,
                  onTap: () {
                    Get.to(SearchScreen(shopId),
                        transition: Transition.downToUp,
                        duration: Duration(milliseconds: 200));
                  },
                  cursorHeight: 27,

                  cursorColor: Colors.grey[800],
                  // textInputAction: TextInputAction.sea
                  //rch,
                  showCursor: false,
                  keyboardType: TextInputType.none,
                  placeholder: 'أبحث في المتجر',
                  placeholderStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  prefix: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.grey[500],
                        size: 25,
                      ),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  suffix: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Image.asset(
                      "assets/images/scannerLogo.png",
                      width: 35,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    bottom: cartController.myCart.isEmpty ? 0 : 40),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Column(
                            children: [
                              Container(
                                color: Get.theme.primaryColor,
                                height: 50,
                                padding: EdgeInsets.only(top: 15),
                                width: Get.width,
                                child: ListView.builder(
                                    itemCount: shopCategory!.length,
                                    shrinkWrap: true,
                                    // reverse: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          controller.id.value =
                                              shopCategory![index].id;
                                          controller.categoryItems.clear();
                                          // controller.isLoading2.value = true;
                                          controller.getShopItem(
                                              controller.id.value, shopId);
                                        },
                                        child: Container(
                                          width: 110,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Obx(
                                            () => Column(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      shopCategory![index].name,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: controller.id
                                                                      .value ==
                                                                  shopCategory![
                                                                          index]
                                                                      .id
                                                              ? Colors.white
                                                              : Colors.white
                                                                  .withOpacity(
                                                                      0.9),
                                                          fontWeight: controller
                                                                      .id
                                                                      .value ==
                                                                  shopCategory![
                                                                          index]
                                                                      .id
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal),
                                                    ),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                    // // padding: EdgeInsets.,
                                                    constraints: BoxConstraints(
                                                        maxHeight: 10,
                                                        minHeight: 0,
                                                        minWidth: 0,
                                                        maxWidth: 125),
                                                    height: 4,
                                                    width: controller
                                                                .id.value ==
                                                            shopCategory![index]
                                                                .id
                                                        ? 125
                                                        : 0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        color: Colors.white),
                                                    duration: Duration(
                                                        milliseconds: 500)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: controller.isItemLoading.value
                                    ? Container(
                                        child: Center(
                                            child: Container(
                                                width: 35,
                                                height: 35,
                                                child:
                                                    CircularProgressIndicator())))
                                    : Container(
                                        child: controller.categoryItems.isEmpty
                                            ? Container(
                                                child: Center(
                                                    child:
                                                        Text("لا يوجد بيانات")))
                                            : GridView.builder(
                                                itemCount: controller
                                                    .categoryItems.length,
                                                itemBuilder: (context, index) {
                                                  return itemCardAll(
                                                      controller
                                                          .categoryItems[index],
                                                      index);
                                                },
                                                scrollDirection: Axis.vertical,
                                                // controller: _scrollController,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio:
                                                      (Get.width / 2) / 295,
                                                  // crossAxisSpacing: 5.0,
                                                  // mainAxisSpacing: 5.0,
                                                ),
                                              ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => cartController.myCart.isEmpty
                    ? Container()
                    : Container(
                        width: Get.width,
                        height: 60,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey[500]!, blurRadius: 6)
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
                              height: 40,
                              // width: 150,
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
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 15,
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
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
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
    );
  }
}
