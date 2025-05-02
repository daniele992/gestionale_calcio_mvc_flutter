import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_divider_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_header_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/social_footer.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/login/login_screen.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/signup/widgets/signup_forms_widget.dart";
import "package:get/get.dart";


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.1,
                ),
                const SignUpFormWidget(),
                const TFormDividerWidget(),
                SocialFooter(
                  text1: tAlreadyHaveAnAccount,
                  text2: tLogin,
                  onPressed: () => Get.off(() => const LoginScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
