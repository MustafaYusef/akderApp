import 'package:akhder_app/controllers/driverControllers/orderDriverController.dart';
import 'package:akhder_app/ui/customWidget/DriverOrderCard.dart';
import 'package:akhder_app/ui/customWidget/customDrawerDriver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverTaskOrderScreen extends StatelessWidget {
  DriverTaskOrderScreen({Key? key}) : super(key: key);
  DriverOrderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getTaskOrder();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.grey[100],
        title: Text(
          "الطلبات الحالية",
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
                    child: controller.isTaskLoading.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.myTaskOrder.isEmpty
                                ? RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getTaskOrder();
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
                                      return controller.getTaskOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount: controller.myTaskOrder.length,
                                      itemBuilder: (context, index) {
                                        return driverOrderCard(
                                            controller.myTaskOrder[index]);
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
