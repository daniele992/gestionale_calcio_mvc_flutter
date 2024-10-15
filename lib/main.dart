import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gestionale_calcio_mvc_flutter/firebase_options.dart';
//import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';
import 'package:get/get.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((_) => Get.put(AuthenticationRepository()));

  /// -- Main App Starts here (app.dart) ...
  runApp(const App());


}
