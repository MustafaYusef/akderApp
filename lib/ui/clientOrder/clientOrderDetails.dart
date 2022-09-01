import 'package:akhder_app/controllers/vendorControllers/orderVendorController.dart';
import 'package:akhder_app/data/orderModel.dart';
import 'package:akhder_app/ui/clientOrder/itemVendorOrderCard.dart';
import 'package:akhder_app/ui/customWidget/itemVendorOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CientOrderDetailsScreen extends StatelessWidget {
  MyOrder item;
  CientOrderDetailsScreen(this.item);
  // OrderVendorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "تفاصيل الطلب",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            elevation: 3,
            child: Container(
              height: 110,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "السعر: ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  item.finalPrice.toString() + " IQD",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "الوقت: ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  item.createdAt.toString().split(" ")[0] +
                                      "    " +
                                      item.createdAt
                                          .toString()
                                          .split(" ")[1]
                                          .split(".")[0],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  height: 40,
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // if (!controller.selectedTenders
                                      //     .contains(item)) {
                                      //   controller.selectedTenders.add(item);
                                      // } else {
                                      //   controller.selectedTenders
                                      //       .remove(item);
                                      // }

                                      // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: Get.theme.primaryColor
                                              .withOpacity(0.2),
                                          // border: Border.all(color: Get.theme.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item.status,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            // Container(
                                            //   child: Icon(
                                            //     Icons.check,
                                            //     size: 16,
                                            //     color: Get.theme.primaryColor,
                                            //   ),
                                            // ),
                                            // SizedBox(
                                            //   width: 10,
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: item.itemsData.length,
                itemBuilder: (context, index) {
                  return clientOrderItemCard(item.itemsData[index]);
                },
                scrollDirection: Axis.vertical,
                // // controller: _scrollController,
                // gridDelegate:
                //     SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   childAspectRatio: (Get.width / 2) / 360,
                //   // crossAxisSpacing: 5.0,
                //   // mainAxisSpacing: 5.0,
                // ),
              ),
            ),
          ),
          // item.orderStatus != 1
          //     ? Container()
          //     : Row(
          //         children: [
          //           Expanded(
          //             flex: 3,
          //             child: Container(
          //               margin:
          //                   EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: Colors.white),
          //               height: 50,
          //               // width: Get.width,
          //               child: ElevatedButton(
          //                 onPressed: () {
          //                   // if (!controller.selectedTenders
          //                   //     .contains(item)) {
          //                   //   controller.selectedTenders.add(item);
          //                   // } else {
          //                   //   controller.selectedTenders
          //                   //       .remove(item);
          //                   // }
          //                   controller.changeStatus(item.id, 1);
          //                   // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
          //                 },
          //                 style: ElevatedButton.styleFrom(
          //                   elevation: 1,
          //                   primary: Colors.white,
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(10.0)),
          //                   padding: EdgeInsets.all(0.0),
          //                 ),
          //                 child: Ink(
          //                   decoration: BoxDecoration(
          //                       color: Get.theme.primaryColor,
          //                       borderRadius: BorderRadius.circular(10.0)),
          //                   child: Container(
          //                     alignment: Alignment.center,
          //                     child: Row(
          //                       children: [
          //                         Expanded(
          //                           child: Text(
          //                             "قبول الطلب",
          //                             textAlign: TextAlign.center,
          //                             style: TextStyle(
          //                                 color: Colors.white, fontSize: 18),
          //                           ),
          //                         ),
          //                         // Container(
          //                         //   child: Icon(
          //                         //     Icons.check,
          //                         //     size: 16,
          //                         //     color: Get.theme.primaryColor,
          //                         //   ),
          //                         // ),
          //                         // SizedBox(
          //                         //   width: 10,
          //                         // )
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //             flex: 2,
          //             child: Container(
          //               margin:
          //                   EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: Colors.white),
          //               height: 50,
          //               // width: Get.width,
          //               child: ElevatedButton(
          //                 onPressed: () {
          //                   // if (!controller.selectedTenders
          //                   //     .contains(item)) {
          //                   //   controller.selectedTenders.add(item);
          //                   // } else {
          //                   //   controller.selectedTenders
          //                   //       .remove(item);
          //                   // }
          //                   controller.changeStatus(item.id, 2);
          //                   // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
          //                 },
          //                 style: ElevatedButton.styleFrom(
          //                   elevation: 1,
          //                   primary: Colors.white,
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(10.0)),
          //                   padding: EdgeInsets.all(0.0),
          //                 ),
          //                 child: Ink(
          //                   decoration: BoxDecoration(
          //                       color: Colors.white,
          //                       border: Border.all(color: Colors.red),
          //                       borderRadius: BorderRadius.circular(10.0)),
          //                   child: Container(
          //                     alignment: Alignment.center,
          //                     child: Row(
          //                       children: [
          //                         Expanded(
          //                           child: Text(
          //                             "رفض الطلب",
          //                             textAlign: TextAlign.center,
          //                             style: TextStyle(
          //                                 color: Colors.black, fontSize: 18),
          //                           ),
          //                         ),
          //                         // Container(
          //                         //   child: Icon(
          //                         //     Icons.check,
          //                         //     size: 16,
          //                         //     color: Get.theme.primaryColor,
          //                         //   ),
          //                         // ),
          //                         // SizedBox(
          //                         //   width: 10,
          //                         // )
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
        ],
      ),
    );
  }
}
