import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gestionale_calcio_mvc_flutter/src/localization/app_localizations.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/app_bindings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

/*
The App class is used to initialize the app and to set the theme, color and home screen of the application,
and in turn extends the StatelessWidget class which makes the app itself a widget.
 */

class App extends StatelessWidget {
  const App({super.key});

  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
      /*
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
      localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
      ],

      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },
      */
      /// -- README(Docs[3]) -- Bindings
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,

      /// -- README(Docs[4]) -- use Screen Transitions here
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),

      /// -- README(Docs[5]) -- Home Screen or Progress Indicator
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}