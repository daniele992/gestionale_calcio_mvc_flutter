import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/theme/theme.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
   const App({Key? key}) : super(key: key);   //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AppHome(),
    );//Closed Material App
  } // Closed widget
}

class AppHome extends StatelessWidget{
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text(".appable/")),
      body: const Center(child: Text("Home Page")),
    );
  } //Closed Widget



}// Closed class AppHome
