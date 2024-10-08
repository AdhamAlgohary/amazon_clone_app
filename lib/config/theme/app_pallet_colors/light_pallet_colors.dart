import 'package:flutter/material.dart';

abstract class LightPalletColor {
  static const lightPrimary = Color.fromRGBO(236, 137, 6, 1);
  static const lightOnPrimary = Colors.black;

  static const lightSecondary = Color.fromRGBO(236, 137, 6, 1);
  static const lightOnSecondary = Colors.white;

  static const lightError = Colors.red;
  static const lightOnError = Colors.black;

  static const lightSurfaceVariant = Colors.white;
  static const lightOnSurfaceVariant = Colors.grey;

  static const lightSurface = Color.fromARGB(255, 209, 209, 209);
  static const lightOnSurface = Colors.black;

  static const lightOutlineVariant = Colors.black;
  static const lightOutline = Colors.lightBlue;
  
  static const lightDisableOrHintItem = Color.fromARGB(255, 192, 191, 191);

  static const gold=Color(0xffFF9900);

  static const lightColorSchema = ColorScheme.light(
    brightness: Brightness.light,

    primary: lightPrimary,
    onPrimary: lightOnPrimary,

    secondary: lightSecondary,
    onSecondary: lightOnSecondary,

    error: lightError,
    onError: lightOnError,

    surface: lightSurface,
    onSurface: lightOnSurface,

    surfaceContainerHighest:
        lightSurfaceVariant,  
          onSurfaceVariant: lightOnSurfaceVariant
  );
}