import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/widget_themes/text_theme.dart';
//import 'package:google_fonts/google_fonts.dart';

class TAppTheme{

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    //elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );

static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutLinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
);

} //Closed Class TAppTheme