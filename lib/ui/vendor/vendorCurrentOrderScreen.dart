import 'package:akhder_app/controllers/vendorControllers/orderVendorController.dart';
import 'package:akhder_app/ui/customWidget/vendorOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorCurrentOrderScreen extends StatefulWidget {
  VendorCurrentOrderScreen({Key? key}) : super(key: key);

  @override
  State<VendorCurrentOrderScreen> createState() =>
      _VendorCurrentOrderScreenState();
}

class _VendorCurrentOrderScreenState extends State<VendorCurrentOrderScreen> {
  OrderVendorController controller = Get.put(OrderVendorController());

  @override
  void initState() {
    super.initState();

    // _bindingPrinter().then((bool? isBind) async => {
    //       if (isBind!)
    //         {
    //           _getPrinterStatus(),
    //           _printerMode = await _getPrinterMode(),
    //         }
    //     });
  }

  /// must binding ur printer at first init in app
  // Future<bool?> _bindingPrinter() async {
  //   final bool? result = await SunmiPrinter.bindingPrinter();
  //   return result;
  // }

  // /// you can get printer status
  // Future<void> _getPrinterStatus() async {
  //   final PrinterStatus result = await SunmiPrinter.getPrinterStatus();
  //   setState(() {
  //     _printerStatus = result;
  //   });
  // }

  // Future<PrinterMode> _getPrinterMode() async {
  //   final PrinterMode mode = await SunmiPrinter.getPrinterMode();
  //   return mode;
  // }

  // Future<void> _printLabel(Uint8List img) async {
  //   if (_printerStatus == PrinterStatus.NORMAL &&
  //       _printerMode == PrinterMode.LABEL_MODE) {
  //     // must start with this function if you are print with label
  //     await SunmiPrinter.startLabelPrint();

  //     /// 0 align left, 1 center, 2 align right.
  //     await SunmiPrinter.setAlignment(PrintAlign.CENTER);
  //     // spacing line
  //     await SunmiPrinter.lineWrap(1);
  //     // print image only support Uint8List
  //     await SunmiPrinter.printImage(img);
  //     // only run exitLabelPrint at last index if you need print multiple label at once;
  //     await SunmiPrinter.exitLabelPrint();
  //   }
  // }

  // printdddd() async {
  //   String url = 'https://pngimg.com/uploads/nike/small/nike_PNG18.png';
  //   // convert image to Uint8List format
  //   Uint8List byte = (await NetworkAssetBundle(Uri.parse(url)).load(url))
  //       .buffer
  //       .asUint8List();

  //   await _printLabel(byte);
  // }

  @override
  Widget build(BuildContext context) {
//     void printInvoice() async {
//       print(" sumniiiii  .. . . . . . .. print .... .. .. ........  ");
//       SunmiPrinter.hr(); // prints a full width separator
//       SunmiPrinter.text(
//         'Test Sunmi Printer',
//         styles: SunmiStyles(align: SunmiAlign.center),
//       );
//       SunmiPrinter.hr();

// // Test align
//       SunmiPrinter.text(
//         'left',
//         styles: SunmiStyles(bold: true, underline: true),
//       );
//       SunmiPrinter.text(
//         'center',
//         styles:
//             SunmiStyles(bold: true, underline: true, align: SunmiAlign.center),
//       );
//       SunmiPrinter.text(
//         'right',
//         styles:
//             SunmiStyles(bold: true, underline: true, align: SunmiAlign.right),
//       );

// // Test text size
//       SunmiPrinter.text('Extra small text',
//           styles: SunmiStyles(size: SunmiSize.xs));
//       SunmiPrinter.text('Medium text', styles: SunmiStyles(size: SunmiSize.md));
//       SunmiPrinter.text('Large text', styles: SunmiStyles(size: SunmiSize.lg));
//       SunmiPrinter.text('Extra large text',
//           styles: SunmiStyles(size: SunmiSize.xl));

// // Test row
//       SunmiPrinter.row(
//         cols: [
//           SunmiCol(text: 'col1', width: 4),
//           SunmiCol(text: 'col2', width: 4, align: SunmiAlign.center),
//           SunmiCol(text: 'col3', width: 4, align: SunmiAlign.right),
//         ],
//       );

// // Test image
//       ByteData bytes = await rootBundle.load('assets/images/akderLogo.png');
//       final buffer = bytes.buffer;
//       final imgData = base64.encode(Uint8List.view(buffer));
//       SunmiPrinter.image(imgData);

//       SunmiPrinter.emptyLines(3);
//     }

    controller.getCurrentOrder();
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
                                      // printdddd();
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
                                      // printdddd();
                                      return controller.getCurrentOrder();
                                    },
                                    child: ListView.builder(
                                      itemCount:
                                          controller.myCurrentOrder.length,
                                      itemBuilder: (context, index) {
                                        return vendorOrderCard(
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
