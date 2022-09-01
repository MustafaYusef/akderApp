import 'dart:io';
import 'package:akhder_app/controllers/loginController.dart';
import 'package:akhder_app/methods/alerts.dart';
import 'package:akhder_app/repostary/mainRepostary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logInScreen.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  // final String token;
  final String phone;

  PinCodeVerificationScreen(this.phone);
  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;
  bool flage = true;
  LoginController controller = Get.put(LoginController());
  // String code = "+964";
  bool isLoading = false;

  /// this [StreamController] will take input of which function should be called

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // onTapRecognizer = TapGestureRecognizer()
    //   ..onTap = () async {
    //     // MainRepostary repo = MainRepostary();
    //     try {
    //       controller.verify();
    //     } catch (e) {}
    //   };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            'التحقق من رقم الهاتف',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/akderLogo.png",
                  width: Get.width - 50,
                  height: Get.height / 3.5,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: RichText(
                      text: TextSpan(
                          text: "أدخل الرمز المرسل إلى ",
                          children: [
                            TextSpan(
                                text: widget.phone,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize: 16)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.length != 4) {
                              hasError = true;
                            } else {
                              hasError = false;
                            }
                            controller.verifyController.text = value.toString();
                          });
                        },
                        appContext: Get.context!,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  // error showing widget
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      hasError ? "*املأ الحقول بشكل صحيح" : "",
                      style:
                          TextStyle(color: Colors.red.shade300, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: FlatButton(
                        onPressed: () async {
                          if (controller.verifyController.text
                                  .toString()
                                  .length ==
                              4) {
                            controller.verify();
                          } else {
                            showSnake("أدخل الرمز الصحيح");
                          }
                        },
                        child: Center(
                            child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "تاكيد الرمز",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).primaryColor,
                              offset: Offset(1, -2),
                              blurRadius: 10),
                          BoxShadow(
                              color: Theme.of(context).primaryColor,
                              offset: Offset(-1, 2),
                              blurRadius: 10)
                        ]),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Directionality(
                //   textDirection: TextDirection.rtl,
                //   child: RichText(
                //     textAlign: TextAlign.center,
                //     text: TextSpan(
                //         text: "لم تصلك رسالة؟ ",
                //         style: TextStyle(color: Colors.black54, fontSize: 15),
                //         children: [
                //           TextSpan(
                //               text: "إعادة ارسال",
                //               recognizer: onTapRecognizer,
                //               style: TextStyle(
                //                   color: Color(0xFF91D3B3),
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 18))
                //         ]),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
