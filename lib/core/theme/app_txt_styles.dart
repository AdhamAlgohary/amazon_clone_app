import 'package:amazon_clone_app/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTxtStyle {
  static final txtInsideBtnStyle = GoogleFonts.rubik(
      textStyle: const TextStyle(color: AppColors.txtInsideBtnColor));
  static final txtInsideTxtFieldStyle = GoogleFonts.rubik(
      textStyle: const TextStyle(color: AppColors.hintOrDisableColor));
  static final labelTxtStyle = GoogleFonts.rubik(
      textStyle: const TextStyle(
          color: AppColors.secondaryColor, fontWeight: FontWeight.bold));
}
