import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTxtStyle {
  static TextStyle largeLabelTxtStyle(BuildContext context) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 0.08 * ScreenSize.screenWidth(context: context)));
  }

  static TextStyle smallBodyTxtStyle(BuildContext context) {
    return GoogleFonts.rubik(
        textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 0.04 * ScreenSize.screenWidth(context: context)));
  }
}
