import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../view/on_boarding/on_boarding_page_widget.dart';
import '../view/welcome/welcome_screen.dart';

///This class is used to manage the behavior of the onboarding screen in a Flutter app. It uses GetX for state management and LiquidSwipe for page animations.
class OnBoardingController extends GetxController {
  //Variables
  final userStorage = GetStorage(); // Use for local Storage
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  //Functions to trigger Skip, Next and onPageChange Events
  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() => controller.animateToPage(page: controller.currentPage + 1);

  animateToNextSlideWithLocalStorage() {
    if (controller.currentPage == 2) {
      userStorage.write('isFirstTime', false);
      print(userStorage.read('isFirstTime'));
      Get.offAll(() => const WelcomeScreen());
    } else {
      controller.animateToPage(page: controller.currentPage + 1);
    }
  }

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;

  //Three Onboarding Pages
  final pages = [

    //First OnBoardingPage
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: tOnBoardingTitle1,
        subTitle: tOnBoardingSubTitle1,
        counterText: tOnBoardingCounter1,
        bgColor: tOnBoardingPage1Color,
      ),
    ),

    //Second OnBoardingPage
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: tOnBoardingTitle2,
        subTitle: tOnBoardingSubTitle2,
        counterText: tOnBoardingCounter2,
        bgColor: tOnBoardingPage2Color,
      ),
    ),

    //Thirst OnBoardingPage
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: tOnBoardingTitle3,
        subTitle: tOnBoardingSubTitle3,
        counterText: tOnBoardingCounter3,
        bgColor: tOnBoardingPage3Color,
      ),
    ),
  ];
}
