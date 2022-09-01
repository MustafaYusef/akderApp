import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

const baseUrl = "https://alansegalabpro.com/api/";
const myGrey = Color(0xffF6F5F0);
const myRed = Color(0xffD00216);
const noNet = "لا يوجد أتصال بالشبكة";
var textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);
var textFieldStyleRed = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Get.theme.primaryColor,
    width: 1,
  ),
);
var textFieldStyleBlack = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);
