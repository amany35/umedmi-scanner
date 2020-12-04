import 'package:flutter/material.dart';

import 'AppColors.dart';

const headerStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w900);
const subHeaderStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
const LABEL_TEXT_STYLE = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontFamily: "Regular",
);

const notmalTextStyle = TextStyle(
    color: const Color(0XFFFFFFFF),
    fontSize: 16.0,
    fontWeight: FontWeight.normal);

ThemeData appTheme = new ThemeData(
  hintColor: Colors.white,
);

const textFieldColor = Color.fromRGBO(255, 255, 255, 0.1);

const primaryColor = Color(0xFF00c497);

const buttonTextStyle = TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 14.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);

const normalTextStyle = const TextStyle(
    color: BLACK,
    fontWeight: FontWeight.w400,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontSize: 10.0);

const highSizeTextStyle = const TextStyle(
    color: const Color(0xff333333),
    fontWeight: FontWeight.w700,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontSize: 11.0);

const lineThroughTextStyle = const TextStyle(
    decoration: TextDecoration.lineThrough,
    color: BROWN_GREY,
    fontWeight: FontWeight.w400,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontSize: 10.0);
const discountTextStyle = const TextStyle(
    color: const Color(0xffff6600),
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
    fontStyle: FontStyle.normal,
    fontSize: 11.0);
DecorationImage tick = new DecorationImage(
  image: new ExactAssetImage('assets/tick.png'),
  fit: BoxFit.cover,
);
