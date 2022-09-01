import 'package:akhder_app/controllers/vendorControllers/orderVendorController.dart';
import 'package:akhder_app/ui/customWidget/vendorOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendrHistoryOrderScreen extends StatelessWidget {
  VendrHistoryOrderScreen({Key? key}) : super(key: key);
  OrderVendorController controller = Get.put(OrderVendorController());

  @override
  Widget build(BuildContext context) {
    controller.getHistoryOrder();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "الطلبات السابقة",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: controller.isLoadingHistory.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.myHistoryOrder.isEmpty
                                ? RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getHistoryOrder();
                                    },
                                    child: ListView(
                                      children: [
                                        Container(
                                            height: Get.height,
                                            child: Center(
                                                child: Text("لا يوجد بيانات"))),
                                      ],
                                    ),
                                  )
                                : RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getHistoryOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount:
                                          controller.myHistoryOrder.length,
                                      itemBuilder: (context, index) {
                                        return vendorOrderCard(
                                            controller.myHistoryOrder[index]);
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
