import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

///Defines the style of the top bar (AppBar) of the app, for both light and dark modes. Example: appBarTheme: TAppBarTheme.lightAppBarTheme
class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: tDarkColor, size: 18.0),
      actionsIconTheme: IconThemeData(color: tDarkColor, size: 18.0));

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: tWhiteColor, size: 18.0),
    actionsIconTheme: IconThemeData(color: tWhiteColor, size: 18.0),
  );
}
