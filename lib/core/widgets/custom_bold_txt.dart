import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBoldTxt extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  const CustomBoldTxt({super.key, required this.text, this.fontSize, this.textColor});

  @override
  Widget build(BuildContext context) {
    final width =Helper.screenWidth(context: context);
    return  Text(text,style: GoogleFonts.rubik(
                  textStyle:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color:textColor?? LightPalletColor.lightOnSurface,
                      fontSize:fontSize?? 0.04*width 
                      )),);
  }
}