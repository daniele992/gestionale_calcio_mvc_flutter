import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/colors.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor: tPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.6,
            ), //const?
             Column( //const?
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ), //headLine3?
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ), //bodyText1?
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: (){},
                        child: Text(tLogin.toUpperCase())),),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: (){},
                        child: Text(tSignup.toUpperCase())),),
              ],
            )
          ],
        ),
      ),
    ); //Scaffold

  } //Widget


} // Class Welcome Screen