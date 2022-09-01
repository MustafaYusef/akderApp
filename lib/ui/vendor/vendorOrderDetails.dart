import 'dart:convert';
import 'dart:typed_data';

import 'package:akhder_app/controllers/vendorControllers/orderVendorController.dart';
import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/ui/customWidget/itemVendorOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
import 'package:get/get.dart';
// import 'package:sunmi_printer/sunmi_printer.dart';

class VendorOrderDetailsScreen extends StatefulWidget {
  OrderVendor item;
  VendorOrderDetailsScreen(this.item);

  @override
  State<VendorOrderDetailsScreen> createState() =>
      _VendorOrderDetailsScreenState();
}

class _VendorOrderDetailsScreenState extends State<VendorOrderDetailsScreen> {
  OrderVendorController controller = Get.find();

  // void _print() async {
  //   // Test regular text
  //   SunmiPrinter.hr();
  //   SunmiPrinter.text(
  //     'Test Sunmi Printer',
  //     styles: SunmiStyles(align: SunmiAlign.center),
  //   );
  //   SunmiPrinter.hr();

  //   // Test align
  //   SunmiPrinter.text(
  //     'left',
  //     styles: SunmiStyles(bold: true, underline: true),
  //   );
  //   SunmiPrinter.text(
  //     'center',
  //     styles:
  //         SunmiStyles(bold: true, underline: true, align: SunmiAlign.center),
  //   );
  //   SunmiPrinter.text(
  //     'right',
  //     styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.right),
  //   );

  //   // Test text size
  //   SunmiPrinter.text('Extra small text',
  //       styles: SunmiStyles(size: SunmiSize.xs));
  //   SunmiPrinter.text('Medium text', styles: SunmiStyles(size: SunmiSize.md));
  //   SunmiPrinter.text('Large text', styles: SunmiStyles(size: SunmiSize.lg));
  //   SunmiPrinter.text('Extra large text',
  //       styles: SunmiStyles(size: SunmiSize.xl));

  //   // Test row
  //   SunmiPrinter.row(
  //     cols: [
  //       SunmiCol(text: 'col1', width: 4),
  //       SunmiCol(text: 'col2', width: 4, align: SunmiAlign.center),
  //       SunmiCol(text: 'col3', width: 4, align: SunmiAlign.right),
  //     ],
  //   );

  //   // Test image
  //   ByteData bytes = await rootBundle.load('assets/images/akderLogo.png');
  //   final buffer = bytes.buffer;
  //   final imgData = base64.encode(Uint8List.view(buffer));
  //   SunmiPrinter.image(imgData);

  //   SunmiPrinter.emptyLines(3);
  // }

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
              height: 124,
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
                                  widget.item.finalPrice.toString() + " IQD",
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
                                  widget.item.createdAt
                                          .toString()
                                          .split(" ")[0] +
                                      "    " +
                                      widget.item.createdAt
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
                                                widget.item.status,
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
                itemCount: widget.item.itemsData.length,
                itemBuilder: (context, index) {
                  return vendorOrderItemCard(widget.item.itemsData[index]);
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
          widget.item.orderStatus != 1
              ? Container()
              : Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 50,
                        // width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            // if (!controller.selectedTenders
                            //     .contains(item)) {
                            //   controller.selectedTenders.add(item);
                            // } else {
                            //   controller.selectedTenders
                            //       .remove(item);
                            // }
                            controller.changeStatus(widget.item.id, 1);
                            // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "قبول الطلب",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
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
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 50,
                        // width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            // if (!controller.selectedTenders
                            //     .contains(item)) {
                            //   controller.selectedTenders.add(item);
                            // } else {
                            //   controller.selectedTenders
                            //       .remove(item);
                            // }
                            controller.changeStatus(widget.item.id, 2);
                            // _modalBottomSheetMenu(item.shops, item.mainCategoryName);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "رفض الطلب",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
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
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.white),
          //       height: 50,
          //       width: Get.width - 20,
          //       child: ElevatedButton(
          //         onPressed: () async {
          //           // String url =
          //           //     'https://pngimg.com/uploads/nike/small/nike_PNG18.png';
          //           // // convert image to Uint8List format
          //           // Uint8List byte =
          //           //     (await NetworkAssetBundle(Uri.parse(url)).load(url))
          //           //         .buffer
          //           //         .asUint8List();

          //           // _print();
          //         },
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
          //                     style:
          //                         TextStyle(color: Colors.white, fontSize: 18),
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
