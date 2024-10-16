import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/colors.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/login/login_screen.dart';
import 'package:get/get.dart';
import '../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor: tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftBefore: 0,
                leftAfter: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                      tag: 'Welcome-image-tag',
                      child: Image(
                          image: const AssetImage(tWelcomeScreenImage),
                        height: height * 0.6)), //const?
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
                              onPressed: () => Get.to(() => const LoginScreen()),
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
          ),
        ],
      ),
    ); //Scaffold

  } //Widget


} // Class Welcome Screen