import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class Styles {
  static TextStyle textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: ColorManger.primaryColor, // also  black
  );
  static TextStyle textStyle11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorManger.lightGrey, // also  orange,
  );
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // also 700
    color: ColorManger.black, // also orange,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: ColorManger.white,
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorManger.primaryColor,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ColorManger.darkGrey,
  );
}
