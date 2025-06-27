import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/colors.dart';
import '../../../constants/sizes.dart';

class TDropDownButtonFormTheme {
  TDropDownButtonFormTheme._();

  static DropdownMenuThemeData lightDropDownDecorationTheme = DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(tBorderRadius)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: tSecondaryColor),
          borderRadius: BorderRadius.circular(tBorderRadius)
        ),
        floatingLabelStyle: const TextStyle(color:tSecondaryColor),
        prefixIconColor: tSecondaryColor,
      ),
  );

  static DropdownMenuThemeData darkDropDownDecorationTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(tBorderRadius)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: tPrimaryColor),
          borderRadius: BorderRadius.circular(tBorderRadius)
      ),
      floatingLabelStyle: const TextStyle(color:tPrimaryColor),
      prefixIconColor: tPrimaryColor,
    ),
  );

}