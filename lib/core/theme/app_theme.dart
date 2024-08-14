import 'package:amazon_clone_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final lightAppTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: LightAppColors.lightColorSchema,
      // progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: LightAppColors.lightOnPrimary),
      // dividerColor: LightAppColors.lightOnBackground,
      // snackBarTheme:
      //     SnackBarThemeData(contentTextStyle: AppTxtStyle.txtInsideSnackBar),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: LightAppColors.lightOutline, width: 3)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: LightAppColors.lightOnSurface,
              textStyle: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    color: LightAppColors.lightOnSurface)),
              minimumSize: const Size(450, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: LightAppColors.lightPrimary),
          checkColor: MaterialStatePropertyAll(LightAppColors.lightPrimary),
          fillColor:
              MaterialStatePropertyAll(LightAppColors.lightSurfaceVariant)));

  static final darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: DarkAppColors.darkColorSchema,
  );
}
    /*appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(400, 50),
    textStyle: AppTxtStyle.txtInsideBtnStyle,
    foregroundColor: AppColors.txtInsideBtnColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
  )),
  primaryColor: AppColors.primaryColor,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.primaryColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.secondaryColor),
  inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
      iconColor: AppColors.secondaryColor,
      hintStyle: TextStyle(color: AppColors.hintOrDisableColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintOrDisableColor),
          borderRadius: BorderRadius.all(
              Radius.circular(8)))), snackBarTheme: SnackBarThemeData(text)*/