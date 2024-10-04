import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/signup_controller.dart';
import 'package:get/get.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../models/user_model.dart';
import '../../forget_password/forget_password_otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(label: Text(tFullName), prefixIcon: Icon(Icons.person_outline_rounded),),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined),),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers),),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint),),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      //Email e Password Authentication
                      //SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                      //For Phone Authentication
                      //SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                      /*
                      ========
                      TODO: Step - 3 [Get User and Pass it to Controller]

                       */
                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                      );
                      SignUpController.instance.createUser(user);
                      //Get.to(() => const OTPScreen());
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
            )
          ],
        ),
      ),
    );
  }
} //Class SignUpScreen