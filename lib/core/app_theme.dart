import 'package:flutter/material.dart';

final primaryColor = Color.fromARGB(255, 117, 44, 207);
final secondaryColor = Color.fromARGB(255, 203, 178, 234);
final thirdyColor = Color.fromARGB(255, 230, 223, 239);

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: thirdyColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: thirdyColor,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: secondaryColor,
    foregroundColor: primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: primaryColor
    ),
    iconColor: thirdyColor,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: secondaryColor
      ),
    ),
  ),
);