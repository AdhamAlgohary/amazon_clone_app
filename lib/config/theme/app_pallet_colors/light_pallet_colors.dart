import 'package:flutter/material.dart';

abstract class LightPalletColor {

  static const lightPrimary = Color.fromRGBO(236, 137, 6, 1);
  static const lightOnPrimary = Colors.black;

  static const lightSecondary = Color.fromRGBO(236, 137, 6, 1);
  static const lightOnSecondary = Colors.white;

  static const lightError = Colors.red;
  static const lightOnError = Colors.black;

  static const lightSurfaceVariant = Color.fromARGB(255, 209, 209, 209);
  static const lightOnSurfaceVariant = Colors.grey;

  static const lightSurface = Colors.white;
  static const lightOnSurface = Colors.black;

  static const lightOutlineVariant = Colors.black;
  static const lightOutline =  Color.fromARGB(255, 0, 131, 143);
  
  static const lightDisableOrHintItem = Color.fromARGB(255, 192, 191, 191);

  static const gold=Color(0xffFF9900);

    static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5,1],
  );

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