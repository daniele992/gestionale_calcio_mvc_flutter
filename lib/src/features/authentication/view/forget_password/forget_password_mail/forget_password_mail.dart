import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/forget_password/forget_password_otp/otp_screen.dart';
import 'package:get/get.dart';


class ForgetPasswordMailScreen extends StatelessWidget{
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  const SizedBox(height: tDefaultSize * 4),
                  const FormHeaderWidget(
                      image: tForgetPasswordImage,
                      title: tForgetPassword,
                      subTitle: tForgetPasswordSubTitle,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      heightBetween: 30.0,
                      textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: tFormHeight),
                  Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text(tEmail),
                              hintText: tEmail,
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){
                                  Get.to(() => const OTPScreen());
                                },
                                child: const Text(tNext)),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}