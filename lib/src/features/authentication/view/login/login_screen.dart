import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/login/widgets/login_form_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/login/widgets/login_header_widget.dart";
import "widgets/login_footer_widget.dart";


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column( //const?
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ //const here and not in column?
                LoginHeaderWidget(/*size: size */),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







