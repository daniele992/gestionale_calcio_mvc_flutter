import  "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_header_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/authentication/view/signup/widgets/signup_forms_widget.dart";

import "../../../../common_widgets/form/form_footer_widget.dart";

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
         child: Container(
           padding: const EdgeInsets.all(tDefaultSize),
           child: const Column(
             children:[
               FormHeaderWidget(
                 image: tWelcomeScreenImage,
                 title: tSignUpTitle,
                 subTitle: tSignUpSubTitle,
                   imageHeight: 0.15,
               ),
               SignUpFormWidget(),
               SignUpFooterWidget(),
             ],
           ),
         ),
        )
      ),
    ); //Scaffold
  }

}

