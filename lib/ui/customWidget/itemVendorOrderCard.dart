import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/vendorControllers/stockVendorController.dart';
import 'package:akhder_app/data/cartModel.dart';
import 'package:akhder_app/data/favouriteModel.dart';
import 'package:akhder_app/data/itemsModel.dart';
import 'package:akhder_app/data/stockItem.dart';
import 'package:akhder_app/data/vendorCurrentOrder.dart';
import 'package:akhder_app/ui/itemDetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'loadingImage.dart';

class vendorOrderItemCard extends StatelessWidget {
  ItemsVendorOrder item;
  vendorOrderItemCard(this.item);
  StockVendorController controller = Get.find();
  // void deleteItem(BuildContext contex) {
  //   controller.deleteCart(item.itemId);
  // }
// void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(
        //     ItemDetailsScreen(
        //         item: Item(
        //             catId: 0,
        //             createdAt: null,
        //             description: "",
        //             id: item.itemId,
        //             imagePath: item.itemImage,
        //             name: item.name,
        //             price: item.price,
        //             storeId: 0,
        //             updatedAt: null),
        //         offerPrice: null,
        //         count: controller.countArray[index]),
        //     transition: Transition.fadeIn,
        //     duration: Duration(milliseconds: 500));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 120,
                  height: 130,
                  imageUrl: item.imagePath,
                  placeholder: (context, url) => loadinImage(),
                  errorWidget: (context, url, error) => loadinImage(),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Container(
                  // width: Get.width / 2 - 10,
                  // height: 70,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.price.toString() + " IQD ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            " / حبة",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children: [
                      //     item.isActive == 1
                      //         ? Container()
                      //         : Container(
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Get.theme.primaryColor),
                      //             height: 40,
                      //             width: 150,
                      //             child: ElevatedButton(
                      //               onPressed: () {
                      //                 controller.changeStatus(item.id, 1);
                      //               },
                      //               style: ElevatedButton.styleFrom(
                      //                 elevation: 0,
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(80.0)),
                      //                 padding: EdgeInsets.all(0.0),
                      //               ),
                      //               child: Ink(
                      //                 decoration: BoxDecoration(
                      //                     color: Get.theme.primaryColor,
                      //                     border: Border.all(
                      //                         color: Get.theme.primaryColor),
                      //                     borderRadius:
                      //                         BorderRadius.circular(10.0)),
                      //                 child: Container(
                      //                   alignment: Alignment.center,
                      //                   child: Text(
                      //                     "عرض المنتج",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontSize: 18),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //     item.isActive == 0
                      //         ? Container()
                      //         : Container(
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 color: Get.theme.primaryColor),
                      //             height: 40,
                      //             width: 150,
                      //             child: ElevatedButton(
                      //               onPressed: () {
                      //                 controller.changeStatus(item.id, 2);
                      //               },
                      //               style: ElevatedButton.styleFrom(
                      //                 elevation: 0,
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(80.0)),
                      //                 padding: EdgeInsets.all(0.0),
                      //               ),
                      //               child: Ink(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     border: Border.all(color: Colors.red),
                      //                     borderRadius:
                      //                         BorderRadius.circular(10.0)),
                      //                 child: Container(
                      //                   alignment: Alignment.center,
                      //                   child: Text(
                      //                     "إخفاء المنتج",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         color: Colors.red, fontSize: 18),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         height: 40,
                      //         // margin: EdgeInsets.symmetric(horizontal: 5),
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               color:
                      //                   Get.theme.primaryColor.withOpacity(0.2),
                      //               borderRadius: BorderRadius.circular(5)),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               InkWell(
                      //                 onTap: () {
                      //                   controller.countArray[index]++;
                      //                   controller.addCart(item.itemId,
                      //                       controller.countArray[index]);
                      //                 },
                      //                 child: Container(
                      //                   child: Padding(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: 16, vertical: 10),
                      //                     child: Icon(
                      //                       Icons.add,
                      //                       color: Get.theme.primaryColor,
                      //                       size: 20,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: 20,
                      //               ),
                      //               Container(
                      //                 padding: EdgeInsets.symmetric(
                      //                     horizontal: 10, vertical: 5),
                      //                 decoration: BoxDecoration(
                      //                     color: Get.theme.primaryColor,
                      //                     borderRadius:
                      //                         BorderRadius.circular(30)),
                      //                 child: Obx(
                      //                   () => Text(
                      //                     controller.countArray[index]
                      //                             .toString() +
                      //                         " حبة",
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontSize: 14,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: 20,
                      //               ),
                      //               Container(
                      //                 child: controller.countArray[index] == 1
                      //                     ? InkWell(
                      //                         onTap: () {
                      //                           controller
                      //                               .deleteCart(item.itemId);
                      //                         },
                      //                         child: Container(
                      //                           child: Padding(
                      //                             padding: EdgeInsets.symmetric(
                      //                                 horizontal: 16,
                      //                                 vertical: 0),
                      //                             child: Icon(
                      //                               Icons.delete,
                      //                               color:
                      //                                   Get.theme.primaryColor,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       )
                      //                     : InkWell(
                      //                         onTap: () {
                      //                           if (controller
                      //                                   .countArray[index] >
                      //                               1) {
                      //                             controller
                      //                                 .countArray[index]--;
                      //                             controller.addCart(
                      //                                 item.itemId,
                      //                                 controller
                      //                                     .countArray[index]);
                      //                           }
                      //                         },
                      //                         child: Container(
                      //                           child: Padding(
                      //                             padding: EdgeInsets.symmetric(
                      //                                 horizontal: 16,
                      //                                 vertical: 10),
                      //                             child: Image.asset(
                      //                               "assets/images/remove.png",
                      //                               width: 12,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //       (item.price * controller.countArray[index])
                      //           .toString(),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          margin: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
