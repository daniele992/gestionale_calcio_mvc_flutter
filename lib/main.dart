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
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );//Closed Material App
  } // Closed widget
}
