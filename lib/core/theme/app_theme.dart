import 'package:amazon_clone_app/core/theme/app_colors.dart';
import 'package:amazon_clone_app/core/theme/app_txt_styles.dart';
import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
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
    brightness: Brightness.light,
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
            borderRadius: BorderRadius.all(Radius.circular(8)))));
