import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key); //const MyApp({super.key})

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeHome(),
    );//Closed Material App
  } // Closed widget
}

class WelcomeHome extends StatelessWidget{
  const WelcomeHome({Key? key}) : super(key: key);
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text(".appable/")),
      body: const Center(child: Text("Home Page")),
    );
  } //Closed Widget
}// Closed class AppHome