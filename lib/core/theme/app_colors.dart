import 'package:flutter/material.dart';

abstract class LightAppColors {
  static const lightPrimary = Color.fromRGBO(236, 137, 6, 1);
  // static const lightOnPrimary = Colors.black;
  static const lightSecondary = Color.fromRGBO(236, 137, 6, 1);
  // static const lightOnSecondary = Colors.white;
  static const lightError = Colors.red;
  // static const lightOnError = Colors.black;
  static const lightBackground = Color.fromRGBO(214, 213, 213, 1);
  // static const lightOnBackground = Colors.black;
  static const lightSurfaceVariant = Colors.white;
  // static const lightOnSurfaceVariant = Colors.grey;
  static const lightSurface = Color(0xFFF7BE75);
  static const lightOnSurface = Colors.black;
  static const lightOutlineVariant = Colors.black;
  static const lightOutline = Colors.lightBlue;
  static const lightDisableOrHintItem = Color.fromARGB(255, 192, 191, 191);

  static const lightColorSchema = ColorScheme.light(
    brightness: Brightness.light,
    primary: lightPrimary,

    // onPrimary: lightOnPrimary,
    secondary: lightSecondary,
    // onSecondary: lightOnSecondary,
    error: lightError,
    // onError: lightOnError,
    background: lightBackground,
    // onBackground: lightOnBackground,
    surface: lightSurface,
    onSurface: lightOnSurface,
    surfaceVariant:
        lightSurfaceVariant, /*   onSurfaceVariant: lightOnSurfaceVariant*/
  );
}

abstract class DarkAppColors {
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
      background: darkBackground,
      onBackground: darkOnBackground,
      surface: darkSurface,
      onSurface: darkOnSurface);
}
