import 'dart:io';

import 'package:akhder_app/controllers/driverControllers/CheckSubsecriptionController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrSearchScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // late Barcode result;
  late QRViewController controller;
  CheckSubsecriptionController controller1 =
      Get.put(CheckSubsecriptionController());
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        centerTitle: true,
        title: Text(
          "إضافة اشتراك",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300),
              // overlay: QrScannerOverlayShape(
              //     borderColor: Colors.black,
              //     cutOutWidth: 300,
              //     cutOutHeight: 300),
            ),
          ),
          Container(
            height: 55,
            width: Get.width - 100,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Get.theme.primaryColor),
            // height: 55,
            // width: Get.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RaisedButton(
                  color: Get.theme.primaryColor,
                  onPressed: () async {
                    await controller.toggleFlash();
                  },
                  child: Icon(Icons.light_mode, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      print("Code Qr .............................");
      print(scanData.code.toString());
      controller1.userId.value = scanData.code!;
      await controller.pauseCamera();
      controller1.getUserInfo(controller1.userId.value);
    });
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
