import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_divider_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_header_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/social_footer.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/login/widgets/login_form_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/signup/signup_screen.dart";
import "package:get/get.dart";
import "../../../../common_widgets/settings/dropDownLang.dart";

///This class is a complete login screen. It uses SafeArea to avoid unsafe areas of the screen (such as notches or system bars).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // <-- Questo lo allinea a destra
                  children: [
                    dropDownLang(
                      colorDropDown: Colors.black,
                      sized: 46,
                      colorInternalDropDown: Colors.black,
                    ),
                  ],
                ),
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  // "tLoginTitle".trans(context),
                  subTitle: tLoginSubTitle,
                ),
                const LoginFormWidget(),
                const TFormDividerWidget(),
                //DropDownLanguage(),
                SocialFooter(
                    text1: tDontHaveAnAccount,
                    text2: tSignup,
                    onPressed: () => Get.off(() => const SignupScreen())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
