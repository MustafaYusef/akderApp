import 'package:akhder_app/methods/getString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetWidget extends StatefulWidget {
  @override
  _NoInternetWidgetState createState() => new _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 120,
            color: Get.theme.primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getTranslate("noNet"),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
