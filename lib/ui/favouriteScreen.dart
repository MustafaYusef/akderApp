import 'package:akhder_app/controllers/cartController.dart';
import 'package:akhder_app/controllers/favouriteController.dart';
import 'package:akhder_app/ui/cartScreen.dart';
import 'package:akhder_app/ui/customWidget/favouriteCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  FavouriteController controller = Get.put(FavouriteController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // controller.getShopItem(catId, shopId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Get.theme.primaryColor),
          elevation: 0,
          centerTitle: true,
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("المفضلة",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      body: Obx(
        () => Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    bottom: cartController.myCart.isEmpty ? 0 : 70),
                child: Container(
                  child: Column(
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
                                                child:
                                                    CircularProgressIndicator())))
                                    : Container(
                                        child: controller.myFavourite.isEmpty
                                            ? RefreshIndicator(
                                                onRefresh: () {
                                                  return controller
                                                      .getFavourite();
                                                },
                                                child: ListView(
                                                  children: [
                                                    Container(
                                                        height: Get.height,
                                                        child: Center(
                                                            child: Text(
                                                                "لا يوجد بيانات"))),
                                                  ],
                                                ),
                                              )
                                            : RefreshIndicator(
                                                onRefresh: () {
                                                  return controller
                                                      .getFavourite();
                                                },
                                                child: ListView.builder(
                                                  itemCount: controller
                                                      .myFavourite.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return favouriteCard(
                                                        controller.myFavourite[
                                                            index]);
                                                  },
                                                  // scrollDirection: Axis.vertical,
                                                  // controller: _scrollController,
                                                  // gridDelegate:
                                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                                  //   crossAxisCount: 2,
                                                  //   childAspectRatio:
                                                  //       (Get.width / 2) / 310,
                                                  // crossAxisSpacing: 5.0,
                                                  // mainAxisSpacing: 5.0,
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
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => cartController.myCart.isEmpty
                    ? Container()
                    : Container(
                        width: Get.width,
                        height: 70,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey[500]!, blurRadius: 6)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "لديك منتجات في السلة",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Get.theme.primaryColor),
                              height: 50,
                              width: 150,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: RaisedButton(
                                    color: Get.theme.primaryColor,
                                    onPressed: () async {
                                      Get.to(CartScreen());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "عرض السلة",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: Colors.teal[900],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            cartController.myCart.length
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
