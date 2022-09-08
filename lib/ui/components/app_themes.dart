import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final primaryColor = Color.fromRGBO(30, 144, 255, 1);
  final primaryColorDark = Color.fromRGBO(0, 0, 139, 1);
  final primaryColorLigth = Color.fromRGBO(135, 206, 250, 1);

  final inputDecorationTheme = InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColorLigth)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      alignLabelWithHint: true);

  final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))));

  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLigth,
      backgroundColor: Colors.white,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonTheme);
}
