import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/ui/vendor/vendorOrderDetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget vendorOrderCard(OrderVendor item) {
  // TendersController controller = Get.find();
  return InkWell(
    onTap: () {
      Get.to(VendorOrderDetailsScreen(item));
    },
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      child: Container(
        height: 160,
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                    color:
                                        Get.theme.primaryColor.withOpacity(0.2),
                                    // border: Border.all(color: Get.theme.primaryColor),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.status,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 2),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           color: Colors.white),
                      //       height: 40,
                      //       width: Get.width - 50,
                      //       child: ElevatedButton(
                      //         onPressed: () {},
                      //         style: ElevatedButton.styleFrom(
                      //           elevation: 1,
                      //           primary: Colors.white,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10.0)),
                      //           padding: EdgeInsets.all(0.0),
                      //         ),
                      //         child: Ink(
                      //           decoration: BoxDecoration(
                      //               color: Get.theme.primaryColor,
                      //               // border: Border.all(color: Get.theme.primaryColor),
                      //               borderRadius: BorderRadius.circular(10.0)),
                      //           child: Container(
                      //             alignment: Alignment.center,
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                   child: Text(
                      //                     "طباعة الفاتورة",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontSize: 16),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
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
  );
}
