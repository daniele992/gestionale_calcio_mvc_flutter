import  "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_header_widget.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/colors.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.all(tDefaultSize),
           child: Column(
             children:  [
               const FormHeaderWidget(
                 image: tWelcomeScreenImage,
                 title: tSignUpTitle,
                 subTitle: tSignUpSubTitle,
               ),
               Container(
                   padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                   child: Form(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         TextFormField(
                           decoration: const InputDecoration(
                               label: Text(tFullName),
                               border: OutlineInputBorder(),
                               prefixIcon: Icon(
                                 Icons.person_outline_rounded,
                                 color: tSecondaryColor,
                               ),
                               labelStyle: TextStyle(color: tSecondaryColor),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     width: 2.0,
                                     color: tSecondaryColor)
                               )
                           ),
                         )
                       ],
                     ),
                   )
               )
             ],
           ),
         ),
        )
      ),
    ); //Scaffold
  }

} //Class SignUpScreen