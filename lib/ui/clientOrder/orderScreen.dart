import 'package:akhder_app/controllers/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../customWidget/orderCard.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({Key? key}) : super(key: key);
  OrderController controller = Get.put(OrderController());

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
          "الطلبات",
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
                    child: controller.isLoading.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.myOrder.isEmpty
                                ? RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getOrder();
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
                                      return controller.getOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount: controller.myOrder.length,
                                      itemBuilder: (context, index) {
                                        return orderCard(
                                            controller.myOrder[index]);
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
