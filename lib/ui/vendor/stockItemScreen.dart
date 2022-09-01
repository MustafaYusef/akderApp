import 'package:akhder_app/const.dart';

import 'package:akhder_app/controllers/vendorControllers/stockVendorController.dart';
import 'package:akhder_app/ui/customWidget/customDrawerVendor.dart';

import 'package:akhder_app/ui/customWidget/stockItemCard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class StockVendorScreen extends StatelessWidget {
  StockVendorScreen({Key? key}) : super(key: key);

  StockVendorController vendorController = Get.put(StockVendorController());

  @override
  Widget build(BuildContext context) {
    // vendorController.g(catId, shopId);
    return Scaffold(
      backgroundColor: myGrey,
      drawer: drawarVendor(
        index: 0,
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          "إدارة المنتجات",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          child: Container(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Obx(
                  () => vendorController.isCatLoading.value
                      ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: myGrey,
                              enabled: true,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: ListView.builder(
                                    itemCount: 20,
                                    shrinkWrap: true,
                                    reverse: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.white,
                          height: 60,
                          padding: EdgeInsets.only(top: 15),
                          width: Get.width,
                          child: ListView.builder(
                              itemCount: vendorController.vendorCat.length,
                              shrinkWrap: true,
                              // reverse: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    vendorController.catId.value =
                                        vendorController.vendorCat[index].id;
                                    // vendorController.vendorCat.clear();
                                    // controller.isLoading2.value = true;
                                    vendorController.getStocks(
                                        vendorController.catId.value);
                                  },
                                  child: Container(
                                    width: 110,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Obx(
                                      () => Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                vendorController
                                                    .vendorCat[index].name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: vendorController
                                                                .catId.value ==
                                                            vendorController
                                                                .vendorCat[
                                                                    index]
                                                                .id
                                                        ? Colors.black
                                                        : Colors.black
                                                            .withOpacity(0.9),
                                                    fontWeight: vendorController
                                                                .catId.value ==
                                                            vendorController
                                                                .vendorCat[
                                                                    index]
                                                                .id
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
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
                                              width: vendorController
                                                          .catId.value ==
                                                      vendorController
                                                          .vendorCat[index].id
                                                  ? 125
                                                  : 0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  color:
                                                      Get.theme.primaryColor),
                                              duration:
                                                  Duration(milliseconds: 500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                ),
                Expanded(
                  child: Obx(
                    () => Container(
                      child: vendorController.isLoading.value
                          ? Container(
                              child: Center(
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      child: CircularProgressIndicator())))
                          : Container(
                              child: vendorController.myStockItems.isEmpty
                                  ? RefreshIndicator(
                                      onRefresh: () {
                                        return vendorController.getStocks(
                                            vendorController.catId.value);
                                      },
                                      child: ListView(
                                        children: [
                                          Container(
                                              height: Get.height,
                                              child: Center(
                                                  child:
                                                      Text("لا يوجد بيانات"))),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      color: Colors.white,
                                      child: RefreshIndicator(
                                        onRefresh: () {
                                          return vendorController.getStocks(
                                              vendorController.catId.value);
                                        },
                                        child: ListView.builder(
                                          itemCount: vendorController
                                              .myStockItems.length,
                                          // physics:
                                          //     NeverScrollableScrollPhysics(),
                                          // shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return stockItemCard(
                                                vendorController
                                                    .myStockItems[index],
                                                index);
                                          },
                                          scrollDirection: Axis.vertical,
                                          // controller: _scrollController,
                                          // gridDelegate:
                                          //     SliverGridDelegateWithFixedCrossAxisCount(
                                          //   crossAxisCount: 2,
                                          //   childAspectRatio:
                                          //       (Get.width / 2) / 310,
                                          //   // crossAxisSpacing: 5.0,
                                          //   // mainAxisSpacing: 5.0,
                                          // ),
                                        ),
                                      ),
                                    ),
                            ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      )),
    );
  }
}
