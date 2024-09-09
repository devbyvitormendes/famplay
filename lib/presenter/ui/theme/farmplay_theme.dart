import 'package:farmplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

sealed class FarmplayTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: ColorsConstants.white,
    ),
  );

  static ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorsConstants.orange,
      onPrimary: ColorsConstants.white,
      secondary: ColorsConstants.yellow,
      onSecondary: ColorsConstants.blue,
      error: ColorsConstants.wine,
      onError: ColorsConstants.white,
      background: ColorsConstants.orange,
      onBackground: ColorsConstants.white,
      surface: ColorsConstants.white,
      onSurface: ColorsConstants.orange,
    ),
    scaffoldBackgroundColor: ColorsConstants.orange,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsConstants.white),
      backgroundColor: ColorsConstants.orange,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: ColorsConstants.white,
        fontFamily: FontConstants.fontFamily,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsConstants.white,
      labelStyle: const TextStyle(
        color: ColorsConstants.white,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsConstants.brown,
        backgroundColor: ColorsConstants.white,
        textStyle: const TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorsConstants.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorsConstants.white,
          width: 1,
        ),
        foregroundColor: ColorsConstants.wine,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: FontConstants.fontFamily,
  );
}