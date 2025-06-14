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
import '../signup/signup_screen.dart';

///This class defines an animated welcome screen that opens immediately when the app starts.
///It displays a main image, a title, a subtitle, and two buttons: one to access the login and one to go to the registration.
///The animation is managed using TFadeInAnimation, which makes the content appear with a fade-in and smooth movement effect.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Stack(
          children: [
            TFadeInAnimation(
              isTwoWayAnimation: false,
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
                padding: const EdgeInsets.all(tDefaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                        tag: 'welcome-image-tag',
                        child: Image(
                            image: const AssetImage(tWelcomeScreenImage),
                            width: width * 0.7,
                            height: height * 0.6)),
                    Column(
                      children: [
                        Text(tWelcomeTitle,
                            style: Theme.of(context).textTheme.displayMedium),
                        Text(tWelcomeSubTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text(tLogin.toUpperCase()),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignupScreen()),
                            child: Text(tSignup.toUpperCase()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ); //SafeArea
  } //Widget
} // Class Welcome Screen
