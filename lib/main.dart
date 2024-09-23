import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/firebase_options.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';
import 'package:get/get.dart';

//void main() => runApp(const App());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

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
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen() //const?
    );//Closed Material App
  } // Closed widget
}
