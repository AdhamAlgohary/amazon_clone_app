import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLightTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: LightPalletColor.lightColorSchema,
       
       appBarTheme: const AppBarTheme(centerTitle: true),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: LightPalletColor.lightSurface,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: LightPalletColor.lightOutline, width: 3)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: LightPalletColor.lightOnSurface,
              backgroundColor: LightPalletColor.gold,
              textStyle: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: LightPalletColor.lightOnSurface)),
              minimumSize: const Size(450, 50),
              shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(color: LightPalletColor.lightOnSurface),
                  borderRadius: BorderRadius.circular(10)))),
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: LightPalletColor.lightPrimary),
          checkColor: WidgetStatePropertyAll(LightPalletColor.lightPrimary),
          fillColor: WidgetStatePropertyAll(LightPalletColor.lightSurface)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: LightPalletColor.lightOutline,
          unselectedItemColor: LightPalletColor.lightOnSurface,
          backgroundColor: LightPalletColor.lightOnSecondary),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  WidgetStatePropertyAll(LightPalletColor.lightOnPrimary))),
      cardTheme: CardTheme(
        color: LightPalletColor.lightSurface,
        shape: Border.all(color: LightPalletColor.lightOnSurface),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: LightPalletColor.lightGreen,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),)),

      searchBarTheme: SearchBarThemeData(
          elevation: const WidgetStatePropertyAll<double?>(5),
          shape: WidgetStatePropertyAll<OutlinedBorder?>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))));
}
