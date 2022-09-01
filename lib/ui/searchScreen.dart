import 'package:akhder_app/controllers/searchItemsController.dart';
import 'package:akhder_app/ui/customWidget/searchCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customWidget/itemCardAllOffer.dart';

class SearchScreen extends StatelessWidget {
  int shopId;
  SearchScreen(this.shopId);
  SearchItemsController controller = Get.put(SearchItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
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
                  onSubmitted: (text) {
                    controller.getShopItem(shopId, text);
                  },
                  cursorHeight: 30,
                  cursorColor: Colors.grey[800],
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
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
      body: Container(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  children: [
                    Expanded(
                      child: controller.isItemLoading.value
                          ? Container(
                              child: Center(
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      child: CircularProgressIndicator())))
                          : Container(
                              child: controller.categoryItems.isEmpty
                                  ? ListView(
                                      children: [
                                        Container(
                                            height: Get.height,
                                            child: Center(
                                                child: Text("لا يوجد بيانات"))),
                                      ],
                                    )
                                  : GridView.builder(
                                      itemCount:
                                          controller.categoryItems.length,
                                      itemBuilder: (context, index) {
                                        return searchCard(
                                            controller.categoryItems[index]);
                                      },
                                      scrollDirection: Axis.vertical,
                                      // controller: _scrollController,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: (Get.width / 2) / 310,
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
      // Column(
      //   children: [
      //     Expanded(
      //       child: controller.isItemLoading.value
      //           ? Container(
      //               child: Center(
      //                   child: Container(
      //                       width: 35,
      //                       height: 35,
      //                       child: CircularProgressIndicator())))
      //           : Container(
      //               child: controller.categoryItems.isEmpty
      //                   ? Container(
      //                       child: Center(child: Text("لا يوجد بياناتs")))
      //                   : GridView.builder(
      //                       itemCount: controller.categoryItems.length,
      //                       itemBuilder: (context, index) {
      //                         return itemCardAll(
      //                             controller.categoryItems[index]);
      //                       },
      //                       scrollDirection: Axis.vertical,
      //                       // controller: _scrollController,
      //                       gridDelegate:
      //                           SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2,
      //                         childAspectRatio: (Get.width / 2) / 360,
      //                         // crossAxisSpacing: 5.0,
      //                         // mainAxisSpacing: 5.0,
      //                       ),
      //                     ),
      //             ),
      //     ),
      //   ],
      // ),
    );
  }
}
