import 'package:akhder_app/controllers/driverControllers/orderDriverController.dart';
import 'package:akhder_app/ui/customWidget/DriverOrderCard.dart';
import 'package:akhder_app/ui/customWidget/customDrawerDriver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverCurrentOrderScreen extends StatelessWidget {
  DriverCurrentOrderScreen({Key? key}) : super(key: key);
  DriverOrderController controller = Get.put(DriverOrderController());

  @override
  Widget build(BuildContext context) {
    controller.getCurrentOrder();
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawarDriver(
        index: 0,
      ),
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
                    child: controller.isLoading.value
                        ? Container(
                            child: Center(
                                child: Container(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator())))
                        : Container(
                            color: Colors.grey[100],
                            child: controller.myCurrentOrder.isEmpty
                                ? RefreshIndicator(
                                    onRefresh: () {
                                      return controller.getCurrentOrder();
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
                                      return controller.getCurrentOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount:
                                          controller.myCurrentOrder.length,
                                      itemBuilder: (context, index) {
                                        return driverOrderCard(
                                            controller.myCurrentOrder[index]);
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
