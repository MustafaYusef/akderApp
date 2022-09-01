import 'package:akhder_app/const.dart';
import 'package:akhder_app/controllers/loginController.dart';
// import 'package:akhder_app/methods/getString.dart';
import 'package:akhder_app/methods/methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegesterScreen extends StatelessWidget {
  RegesterScreen({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            getTranslate("register"),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/akderLogo.png",
                width: Get.width - 50,
                height: Get.height / 3.5,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              getTranslate("fullName"),
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
                        controller: _loginController.nameTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: getTranslate("fullName"),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            focusedBorder: textFieldStyle,
                            border: textFieldStyle,
                            enabledBorder: textFieldStyle,
                            contentPadding: EdgeInsets.all(15)),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) => value!.trim().isEmpty
                            ? getTranslate("fullName")
                            : null,
                      ),
                      SizedBox(height: 20),
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
                        controller: _loginController.phoneRegController,
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
                            contentPadding: EdgeInsets.all(15)),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) => value!.trim().isEmpty
                            ? getTranslate("phone")
                            : null,
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 10),
                      //       child: Text(
                      //         getTranslate("email"),
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.normal,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // TextFormField(
                      //   controller: _loginController.emailController,
                      //   keyboardType: TextInputType.emailAddress,
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.white,
                      //       filled: true,
                      //       hintText: getTranslate("email"),
                      //       hintStyle: TextStyle(
                      //         fontSize: 18,
                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.normal,
                      //       ),
                      //       focusedBorder: textFieldStyle,
                      //       border: textFieldStyle,
                      //       enabledBorder: textFieldStyle,
                      //       contentPadding: EdgeInsets.all(15)),
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      //   // validator: (value) => value.trim().isEmpty
                      //   //     ? "يجب عليك ادخال البريد الألكتروني"
                      //   //     : null,
                      // ),
                      // SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 10),
                      //       child: Text(
                      //         getTranslate("provines"),
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.normal,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Obx(
                      //   () => Container(
                      //     height: 55,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         border: Border.all(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: DropdownButton(
                      //         underline: Container(),
                      //         dropdownColor: Colors.white,
                      //         hint: Container(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 10, vertical: 5),
                      //             child: Text(
                      //               getTranslate("provines"),
                      //               style: TextStyle(
                      //                 fontSize: 18,
                      //                 color: Colors.grey,
                      //                 fontWeight: FontWeight.normal,
                      //               ),
                      //             )),
                      //         isExpanded: true,
                      //         icon: Icon(
                      //           Icons.keyboard_arrow_down_outlined,
                      //           size: 24,
                      //         ),
                      //         value: _loginController.selectedProv.value,
                      //         items: States.js.map((e) {
                      //           return DropdownMenuItem(
                      //             child: Container(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 10, vertical: 0),
                      //               child: Row(
                      //                 children: [
                      //                   Expanded(
                      //                       child: Text(
                      //                     e.keys.elementAt(0),
                      //                     style: TextStyle(
                      //                       fontSize: 18,
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.normal,
                      //                     ),
                      //                   )),
                      //                 ],
                      //               ),
                      //             ),
                      //             value: e,
                      //           );
                      //         }).toList(),
                      //         onChanged: (value) {
                      //           _loginController.selectedProv.value =
                      //               value as Map<String, List<String>>;
                      //           print(_loginController.selectedProv.value.keys);

                      //           _loginController.selectedcity.value = "";
                      //         }),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 10),
                      //       child: Text(
                      //         getTranslate("city"),
                      //         style: TextStyle(
                      //           fontSize: 18,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.normal,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Obx(
                      //   () => Container(
                      //     height: 55,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         border: Border.all(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: _loginController.selectedProv.value == null
                      //         ? Container()
                      //         : DropdownButton(
                      //             underline: Container(),
                      //             dropdownColor: Colors.white,
                      //             hint: Container(
                      //                 padding: const EdgeInsets.symmetric(
                      //                     horizontal: 10, vertical: 5),
                      //                 child: Text(
                      //                   getTranslate("city"),
                      //                   style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: Colors.grey,
                      //                     fontWeight: FontWeight.normal,
                      //                   ),
                      //                 )),
                      //             isExpanded: true,
                      //             icon: Icon(
                      //               Icons.keyboard_arrow_down_outlined,
                      //               size: 24,
                      //             ),
                      //             value:
                      //                 _loginController.selectedcity.value == ""
                      //                     ? null
                      //                     : _loginController.selectedcity.value,
                      //             items: _loginController
                      //                 .selectedProv.value.values.first
                      //                 .map((e) {
                      //               return DropdownMenuItem(
                      //                 child: Container(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 10, vertical: 0),
                      //                   child: Row(
                      //                     children: [
                      //                       Expanded(
                      //                           child: Text(
                      //                         e,
                      //                         style: TextStyle(
                      //                           fontSize: 18,
                      //                           color: Colors.black,
                      //                           fontWeight: FontWeight.normal,
                      //                         ),
                      //                       )),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 value: e,
                      //               );
                      //             }).toList(),
                      //             onChanged: (dynamic value) {
                      //               _loginController.selectedcity.value = value;
                      //               print(_loginController.selectedcity.value);
                      //             }),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
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
                          controller:
                              _loginController.passwordRegTextController,
                          keyboardType: TextInputType.text,
                          obscureText: _loginController.isPassHideReg.value,
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
                              child: _loginController.isPassHideReg.value
                                  ? InkWell(
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: Get.theme.primaryColor,
                                        size: 20,
                                      ),
                                      onTap: () {
                                        // setState(() {
                                        if (_loginController
                                            .isPassHideReg.value) {
                                          _loginController.isPassHideReg.value =
                                              false;
                                        } else {
                                          _loginController.isPassHideReg.value =
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
                                            .isPassHideReg.value) {
                                          _loginController.isPassHideReg.value =
                                              false;
                                        } else {
                                          _loginController.isPassHideReg.value =
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
                      SizedBox(height: 20),
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
                                  if (GetUtils.isPhoneNumber(_loginController
                                          .phoneRegController!.text
                                          .toString()) &&
                                      _loginController.phoneRegController!.text
                                              .toString()
                                              .changeToEngilish()
                                              .length ==
                                          11 &&
                                      _loginController.phoneRegController!.text
                                              .toString()
                                              .changeToEngilish()
                                              .substring(0, 2) ==
                                          "07") {
                                    _loginController.regesterRequest();
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
                                }
                              },
                              child: Text(
                                getTranslate("register"),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ])));
  }
}
