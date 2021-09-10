import 'package:flutter/material.dart';
import 'package:restaurant/utils/utils.dart';

class TextExtension {
  static TextStyle h1Style({required Color textColor}) {
    return TextStyle(
      fontFamily: FontUtil.POPPINS,
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle titleStyle({required Color textColor}) {
    return TextStyle(
      fontFamily: FontUtil.POPPINS,
      color: textColor,
      fontSize: 24,
    );
  }

  static TextStyle normalStyle({required Color textColor}) {
    return TextStyle(
      fontFamily: FontUtil.POPPINS,
      color: textColor,
      fontSize: 14,
    );
  }

  static TextStyle h2Style({required Color textColor}) {
    return TextStyle(
        fontFamily: FontUtil.POPPINS,
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700);
  }
}
