import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constants/colors.dart';
import '../../controllers/on_boarding_controller.dart';


///This class is a Flutter screen that manages a multi-page onboarding flow with smooth animations and page indicators, using the liquid_swipe and smooth_page_indicator packages.
///The OnBoardingController maintains the current onboarding state, handles the pages, and controls actions like advancing or skipping.
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () =>
                  obController.animateToNextSlideWithLocalStorage(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: tDarkColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () => obController.skip(),
                child:
                    const Text("Skip", style: TextStyle(color: Colors.grey))),
          ),
          Obx(() => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: obController.currentPage.value,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xff272727),
                  ),
                ),
              )),
        ],
      ),
    ); //Closed Scaffold
  }
// Closed Widget
}
