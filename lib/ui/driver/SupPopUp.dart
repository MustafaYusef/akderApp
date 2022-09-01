import 'package:akhder_app/controllers/driverControllers/CheckSubsecriptionController.dart';
import 'package:akhder_app/data/subscripModel.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:get/get.dart';

SupPopUp() {
  // TextEditingController text = TextEditingController();
  // print("time ....  " + dateTimeNow.toString());
  CheckSubsecriptionController controller = Get.find();
  var alertStyle = AlertStyle(
    // animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,

    descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    alertPadding: EdgeInsets.all(10),
    buttonAreaPadding: EdgeInsets.all(10),
    animationDuration: Duration(milliseconds: 200),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.black,
    ),
    alertAlignment: Alignment.center,
  );

  Alert(
      style: alertStyle,
      context: Get.context!,
      type: AlertType.info,
      title: controller.profile.value.userName.toString(),
      closeFunction: () {
        Get.back();
      },
      content: Column(
        children: [
          Container(
            child: Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Obx(
                () => DropdownButton(
                    underline: Container(),
                    dropdownColor: Colors.white,
                    hint: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text("نوع الأشتراك")),
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                    ),
                    value: controller.selectedPlan.value.id == 0
                        ? null
                        : controller.selectedPlan.value,
                    items: controller.plans.map((e) {
                      return DropdownMenuItem(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  e.name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  e.cost.toString() + " IQD ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )),
                            ],
                          ),
                        ),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      print((value as Subscription).name);

                      controller.selectedPlan.value = (value as Subscription);
                      controller.selectedPlanId.value =
                          (value as Subscription).id;
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          radius: BorderRadius.circular(20),
          onPressed: () => null,
          child: InkWell(
            onTap: () async {
              print("controller.userId ... .");
              print(controller.userId.value);
              if (controller.userId.value != "")
                controller.storePlan(int.parse(controller.userId.value),
                    controller.selectedPlanId.value);
            },
            child: Container(
              height: 50,
              width: Get.width - 200,
              child: Center(
                child: Text(
                  "تسجيل الإشتراك",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]).show();
}
