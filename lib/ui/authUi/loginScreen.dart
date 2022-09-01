import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/loginController.dart';
import 'package:akhder_app/methods/getString.dart';
import 'package:akhder_app/ui/authUi/regesterSceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            getTranslate("login"),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/akderLogo.png",
                  width: Get.width - 50,
                  height: Get.height / 3.5,
                  fit: BoxFit.contain,
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "TEBA FASHION",
                //   style: TextStyle(
                //       fontSize: 22,
                //       color: Color(0xffC1A269),
                //       fontWeight: FontWeight.bold),
                // ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                getTranslate("phone"),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _loginController.phoneController,
                          keyboardType: TextInputType.phone,
                          maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: getTranslate("phone"),
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: textFieldStyle,
                              border: textFieldStyle,
                              enabledBorder: textFieldStyle,
                              contentPadding: EdgeInsets.all(10)),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (value) => value!.trim().isEmpty
                              ? getTranslate("phone")
                              : null,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                getTranslate("password"),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => TextFormField(
                            controller: _loginController.passwordTextController,
                            keyboardType: TextInputType.text,
                            obscureText: _loginController.isPassHide.value,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: getTranslate("password"),
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: textFieldStyle,
                              border: textFieldStyle,
                              enabledBorder: textFieldStyle,
                              contentPadding: EdgeInsets.all(12),
                              suffix: Container(
                                height: 30,
                                child: _loginController.isPassHide.value
                                    ? InkWell(
                                        child: Icon(
                                          Icons.visibility_off,
                                          color: Get.theme.primaryColor,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          // setState(() {
                                          if (_loginController
                                              .isPassHide.value) {
                                            _loginController.isPassHide.value =
                                                false;
                                          } else {
                                            _loginController.isPassHide.value =
                                                true;
                                          }
                                          // });
                                        },
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.visibility,
                                          color: Get.theme.primaryColor,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          if (_loginController
                                              .isPassHide.value) {
                                            _loginController.isPassHide.value =
                                                false;
                                          } else {
                                            _loginController.isPassHide.value =
                                                true;
                                          }
                                        },
                                      ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            validator: (value) => value!.trim().isEmpty
                                ? getTranslate("password")
                                : null,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.theme.primaryColor),
                          height: 55,
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: RaisedButton(
                                color: Get.theme.primaryColor,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _loginController.loginRequest();
                                  } else {
                                    Get.snackbar("ادخل رقم هاتف صحيح",
                                        "ادخل رقم هاتف صحيح",
                                        duration: Duration(seconds: 3),
                                        icon: Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        ),
                                        colorText: Colors.white,
                                        backgroundColor: Get
                                            .theme.primaryColorDark
                                            .withOpacity(0.3));
                                  }
                                },
                                child: Text(
                                  getTranslate("login"),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.theme.primaryColor),
                          height: 55,
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(RegesterScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Get.theme.primaryColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  getTranslate("register"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 15),
                        // InkWell(
                        //   onTap: () {
                        //     Get.to(SendEmailScreen());
                        //   },
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.symmetric(
                        //             horizontal: 10, vertical: 0),
                        //         child: Text(
                        //           getTranslate("resetPass"),
                        //           style: TextStyle(
                        //             fontSize: 18,
                        //             color: Colors.red,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        )));
  }
}
