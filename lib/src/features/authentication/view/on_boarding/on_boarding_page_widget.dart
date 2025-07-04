import 'package:flutter/material.dart';
import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

///It represents a single page of an app’s onboarding flow. This widget is designed to be used inside a PageView or similar widget to show step-by-step welcome or introduction information.
class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    //super.key,
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSpace),
      color: model.bgColor,
      child: Column(
        //const?
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.45),
          Column(
            children: [
                  Text(
                    model.title.toUpperCase(),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),

              const SizedBox(height: tDefaultSpace), // ⬅️ Vertical space between title and subtitle
              Text(model.subTitle, textAlign: TextAlign.center),

            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
} // class OnBoardingScreen
