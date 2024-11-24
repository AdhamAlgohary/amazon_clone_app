import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle largeLabelTxtStyle(
      {required BuildContext context,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize:
                fontSize ?? 0.08 * Helper.screenWidth(context: context),
            color: color));
  }

  static TextStyle mediumBoldLabelTxtStyle(
      {required BuildContext context,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize:
                fontSize ?? 0.06 * Helper.screenWidth(context: context),
            color: color));
  }

  static TextStyle smallNormalLabelTxtStyle(
      {required BuildContext context,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize:
                fontSize ?? 0.06 * Helper.screenWidth(context: context),
            color: color));
  }

  static TextStyle smallBodyTxtStyle(
      {required BuildContext context,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize:
                fontSize ?? 0.04 * Helper.screenWidth(context: context),
            color: color));
  }

  static TextStyle hintTxtStyle(
      {required BuildContext context,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight}) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize:
                fontSize ?? 0.045 * Helper.screenWidth(context: context),
            color: color));
  }
}
