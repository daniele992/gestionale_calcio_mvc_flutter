import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/appbar_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/dropDown_buttonForm_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/text_theme.dart';

///Defines the light and dark themes of your Flutter app in a centralized way.
class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    dropdownMenuTheme: TDropDownButtonFormTheme.lightDropDownDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    dropdownMenuTheme: TDropDownButtonFormTheme.darkDropDownDecorationTheme,
  );
} //Closed Class TAppTheme
