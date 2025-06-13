import 'package:get/get.dart';
import '../../../features/authentication/view/welcome/welcome_screen.dart';

///This class controls when to start and stop fade-in/fade-out animations and manages screen transitions with animations.
class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animateTwoWay = false.obs;
  RxBool animateSingle = false.obs;

  ///It starts an animation after 500ms, activates animateTwoWay, waits 3 seconds, then deactivates it. After 2 seconds, it changes the screen with a fade-in transition to WelcomeScreen.
  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animateTwoWay.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animateTwoWay.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.off(
      // Get.off Instead of Get.offAll()
      () => const WelcomeScreen(),
      duration: const Duration(milliseconds: 1000), //Transition Time
      transition: Transition.fadeIn, //Screen Switch Transition
    );
  } //startSplashAnimation

  //Can be used to animate In after calling the next screen.
  Future animationIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animateSingle.value = true;
  }

  //Can be used to animate Out before calling the next screen.
  Future animationOut() async {
    animateSingle.value = false;
    await Future.delayed(const Duration(milliseconds: 100));
  }
} //Closed class
