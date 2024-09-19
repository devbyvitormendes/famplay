import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

sealed class FamplayTheme {
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
        fontWeight: FontWeight.w900,
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
        fontWeight: FontWeight.w900,
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
        foregroundColor: ColorsConstants.white,
        backgroundColor: ColorsConstants.brown,
        textStyle: const TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
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
        foregroundColor: ColorsConstants.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: FontConstants.fontFamily,
  );
}