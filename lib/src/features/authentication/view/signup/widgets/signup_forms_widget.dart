import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/signup_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/helper/helper_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../common_widgets/form/checkboxListTile.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {

    const double fontSize = 12;
    bool acceptPrivacyPolicy = false;
    bool acceptTerms = true;

    final controller = Get.put(SignUpController());
    return Container(
      padding: const EdgeInsets.only(top: tFormHeight - 15, bottom: tFormHeight),
      child: Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///TextFormField for insert Full Name
            TextFormField(
              controller: controller.fullName,
              validator: (value){
                if(value!.isEmpty) return 'Name cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  hintText: 'Please insert your Full Name',
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),

            const SizedBox(height: tFormHeight - 20),

            ///TextFormField for insert E-Mail
            TextFormField(
              controller: controller.email,
              validator: Helper.validateEmail,
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(LineAwesomeIcons.envelope),
                  hintText: 'Please insert your E-Mail',
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),

            const SizedBox(height: tFormHeight - 20),

            ///TextFormField for insert phone-no
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) {
                if(value!.isEmpty) return 'Phone number cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  hintText: 'Please insert your phone-no',
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                  prefixIcon: Icon(LineAwesomeIcons.phone_solid)
              ),
            ),

            const SizedBox(height: tFormHeight - 20),

            ///TextFormField For insert password
            Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: Helper.validatePassword,
                  obscureText: controller.showPassword.value ? false : true,
                  decoration: InputDecoration(
                    label: const Text(tPassword),
                    hintText: 'Please enter your password',
                    hintStyle: TextStyle(
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(Icons.fingerprint),
                    suffixIcon: IconButton(
                        icon: controller.showPassword.value
                            ? const Icon(LineAwesomeIcons.eye)
                            : const Icon(LineAwesomeIcons.eye_slash),
                      onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                    ),
                  ),
                ),
            ),

            const SizedBox(height: tFormHeight - 10),

            ///CheckboxListTile for accept privacy
            FormCheckBoxListTile(
              initialValue: false,
              textCheckBox: tPrivacy,
              iconCheckBox: Icons.hourglass_empty,
              subTitle: 'Error',
              onChanged: (value) {
                setState(() {
                  acceptPrivacyPolicy = value;
                  print("acceptPrivacy${acceptPrivacyPolicy}");
                });
              },
            ),

            ///CheckboxListTile for accept conditions
            FormCheckBoxListTile(
              initialValue: false,
              textCheckBox: tConditions,
              iconCheckBox: Icons.hourglass_empty,
              subTitle: 'Error',
              onChanged: (value) {
                setState(() {
                  acceptTerms = value;
                  print("acceptTerms${value}");
                });
              },
            ),

            const SizedBox(height: tFormHeight - 10),

            Obx(
                () => TPrimaryButton(
                  isLoading: controller.isLoading.value ? true : false,
                  text: tSignup.tr,
                  onPressed: controller.isFacebookLoading.value || controller.isGoogleLoading.value
                      ? () {}
                      : controller.isLoading.value
                          ? () {}
                          : () => {controller.createUser(acceptPrivacyPolicy, acceptTerms), print("dddddd${acceptPrivacyPolicy}")},
                ),
            ),
          ],
        ),
      ),
    );
  }
} //Class SignUpScreen