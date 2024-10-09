import 'package:flutter/material.dart';

abstract class DarkPalletColors {
  static const darkPrimary = Color.fromRGBO(236, 137, 6, 1);
  static const darkOnPrimary = Colors.white;
  static const darkSecondary = Color.fromRGBO(236, 137, 6, 1);
  static const darkOnSecondary = Colors.white;
  static const darkError = Colors.red;
  static const darkOnError = Colors.black;
  static const darkBackground = Colors.white;
  static const darkOnBackground = Colors.black;
  static const darkSurface = Colors.grey;
  static const darkOnSurface = Colors.black;

  static const darkColorSchema = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: darkPrimary,
      onPrimary: darkOnPrimary,
      secondary: darkSecondary,
      onSecondary: darkOnSecondary,
      error: darkError,
      onError: darkOnError,
      surface: darkSurface,
      onSurface: darkOnSurface);
}