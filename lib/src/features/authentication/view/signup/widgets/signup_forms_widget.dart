import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/signup_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/helper/helper_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/utils/password_utils.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
  late TextEditingController savePwGenerate;
  late Color strengthColor = Colors.grey;
  late double strengthPercent = 0.0;
  late String strengthLabel = '';

  @override
  void initState() {
    super.initState();
    savePwGenerate = TextEditingController(text: "Valore iniziale");
    Color strengthColor = Colors.grey;
    double strengthPercent = 0.0;
    String strengthLabel = '';
  }

  @override
  void dispose() {
    savePwGenerate.dispose(); //Frees memory when widget is removed
    super.dispose();
  }

  void updateStrength(String pwd) {
    final result = PasswordsUtils.calculateStrengthPassword(pwd);
    setState(() {
      strengthLabel = result['label']!;
      strengthColor = result['color']!;
      strengthPercent = result['percent']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double fontSize = 12;
    String pwGenerate = "";
    Map<String, dynamic> result;
    //double screenHeight = MediaQuery.of(context).size.height;

    final controller = Get.put(SignUpController());

    return Container(
      padding:
          const EdgeInsets.only(top: tFormHeight - 15, bottom: tFormHeight),
      child: Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TextFormField for insert Full Name
            TextFormField(
              controller: controller.fullName,
              validator: (value) {
                if (value!.isEmpty) return 'Name cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  hintText: 'Please insert your Full Name',
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  )),
            ),

            ///Space Between widget
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
                  )),
            ),

            const SizedBox(height: tFormHeight - 20),

            ///TextFormField for insert phone-no
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) {
                if (value!.isEmpty) return 'Phone number cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  hintText: 'Please insert your phone-no',
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                  prefixIcon: Icon(LineAwesomeIcons.phone_solid)),
            ),

            ///Space Between widget
            const SizedBox(height: tFormHeight - 20),

            ///TextFormField For insert password
            Row(
              children: [
                //Expands the text field to fill all available space
                Expanded(
                  child: Obx(
                    () => TextFormField(
                      controller: controller.password,
                      onChanged: updateStrength,
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
                          onPressed: () => controller.showPassword.value =
                              !controller.showPassword.value,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between field and button

                ///Button generate casual Password
                ElevatedButton.icon(
                  onPressed: () {
                    int _randomNumber =
                        PasswordsUtils.getRandomNumberBetween(9, 14);
                    pwGenerate =
                        PasswordsUtils.generateStrongPassword(_randomNumber);
                    controller.password.text = pwGenerate;
                    updateStrength(pwGenerate);
                  },
                  icon: const Icon(Icons.auto_awesome),
                  label: Text(""),
                  style: ElevatedButton.styleFrom(
                    //minimumSize: Size(60, 10),
                    backgroundColor: Colors.green,
                    //Background Button
                    foregroundColor: Colors.white,
                    // Primary Color
                    shadowColor: Colors.purpleAccent,
                    // Shadow Color
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),

            ///Space Between widget
            const SizedBox(height: tFormHeight - 20),

            ///Indicator Strength Password
            Row(
              children: [
                Expanded(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: strengthPercent),
                    duration: Duration(milliseconds: 300),
                    builder: (context, value, _) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: strengthPercent,
                          minHeight: 10,
                          backgroundColor: Colors.grey.shade300,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(strengthColor),
                        ),
                      );
                    },
                  ),
                ),
                //const SizedBox(height: tFormHeight - 20),
                Tooltip(
                  message: '.',
                  waitDuration: Duration(milliseconds: 500),
                  showDuration: Duration(seconds: 2),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),

            ///Space Between widget
            const SizedBox(height: tFormHeight - 25),

            ///Text Strength Password
            Text('Strength Password: $strengthLabel',
                style: TextStyle(
                  color: strengthColor,
                  fontWeight: FontWeight.bold,
                )),

            ///Space Between widget
            const SizedBox(height: tFormHeight - 25),

            ///CheckboxListTile for accept privacy
            Obx(() => CheckboxListTile(
                  title: Text(
                    tPrivacy,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.rtl,
                  ),
                  side: BorderSide(
                      color: controller.acceptPrivacyPolicy.value == true
                          ? Colors.green
                          : Colors.red),
                  secondary: Icon(Icons.hourglass_empty),
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  value: controller.acceptPrivacyPolicy.value,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onChanged: (value) =>
                      controller.acceptPrivacyPolicy.value = value ?? false,
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: Text(
                      style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 8),
                      controller.acceptPrivacyPolicy.value == false
                          ? tNoticeErrorPrivacy
                          : ''),
                )),

            ///CheckboxListTile for accept conditions
            Obx(() => CheckboxListTile(
                  title: Text(
                    tConditions,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.rtl,
                  ),
                  side: BorderSide(
                      color: controller.acceptTerms.value == true
                          ? Colors.green
                          : Colors.red),
                  secondary: Icon(Icons.hourglass_empty),
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  value: controller.acceptTerms.value,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onChanged: (value) =>
                      controller.acceptTerms.value = value ?? false,
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: Text(
                      style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 8),
                      controller.acceptTerms.value == false
                          ? tNoticeErrorPrivacy
                          : ''),
                )),

            ///Space Between widget
            const SizedBox(height: tFormHeight - 20),

            ///Primary Button for SignUp
            Obx(
              () => TPrimaryButton(
                  privacyPolicy: controller.acceptPrivacyPolicy.value,
                  acceptTerms: controller.acceptTerms.value,
                  isLoading: controller.isLoading.value ? true : false,
                  text: tSignup.tr,
                  onPressed: controller.isFacebookLoading.value ||
                          controller.isGoogleLoading.value
                      ? () {}
                      : controller.isLoading.value
                          ? () {}
                          : () {
                              controller.createUser();
                            }),
            ),
          ],
        ),
      ),
    );
  }
} //Class SignUpScreen
