import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gestionale_calcio_mvc_flutter/firebase_options.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/lobby/view/lobby_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

/// ------ For Docs & Updates Check ------
/// ------------- README.md --------------

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /// -- README(Update[]) -- GetX Local Storage
  await GetStorage.init();

  /// -- README(Docs[1]) -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- README(Docs[2]) -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((_) => Get.put(AuthenticationRepository()));

  /// -- Main App Starts here (app.dart) ...
  /* -- Once executed, the compiler will create an instance of the MyApp class and pass
   it to the runApp function which will run the application.
  */
  runApp(const App());
  //runApp(const LobbyScreen());
}
