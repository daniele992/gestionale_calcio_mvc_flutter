import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
   const App({Key? key}) : super(key: key);   //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen() //const?
    );//Closed Material App
  } // Closed widget
}
