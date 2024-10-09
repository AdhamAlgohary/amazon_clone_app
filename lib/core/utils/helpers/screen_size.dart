import 'package:flutter/material.dart';

class ScreenSize {
  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  } 

  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
}