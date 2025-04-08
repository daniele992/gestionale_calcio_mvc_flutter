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
    savePwGenerate.dispose();  //Frees memory when widget is removed
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
    int randomLength = 12; //initial length
    String pwGenerate = "";
    Map<String, dynamic> result;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.cyanAccent,
                            child: Container(
                              width: screenWidth * 0.75,
                              height: screenHeight * 0.45,
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "Do you want to speed up password creation?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Click the button below to create a random password",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          randomLength = PasswordsUtils.getRandomNumberBetween(9, 14);//random number between 9/13
                                          pwGenerate = PasswordsUtils.generateStrongPassword(randomLength);
                                          savePwGenerate.text = pwGenerate;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue, //Color background
                                        foregroundColor: Colors.green, //Color text and icon
                                      ),
                                      child: Text("RANDOM"),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  TextField(
                                    readOnly: true,
                                    controller: savePwGenerate,
                                  ),

                                  const SizedBox(height: 20),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          result = PasswordsUtils.calculateStrengthPassword(pwGenerate);
                                          strengthPercent = result['percent']!;
                                          strengthColor = result['color']!;
                                          strengthLabel = result['label']!;
                                          print(result['label']!);
                                        });
                                      },
                                      child: Text("Salva"),
                                    )
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ); //End ShowDialog
                  },
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
                      onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                    ),
                  ),

                ),
            ),


            const SizedBox(height: tFormHeight - 20),

            ///Indicator Strength Password
            LinearProgressIndicator(
              value: strengthPercent,
              backgroundColor: Colors.grey.shade300,
              color: strengthColor,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: tFormHeight - 10),

            ///Text Strength Password
            Text(
              strengthLabel,
              style: TextStyle(
                color: strengthColor,
                fontWeight: FontWeight.bold,)
            ),

            const SizedBox(height: tFormHeight - 10),

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
                      : Colors.red
              ),
              secondary: Icon(Icons.hourglass_empty),
              activeColor: Colors.green,
              checkColor: Colors.white,
              value: controller.acceptPrivacyPolicy.value,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onChanged: (value) => controller.acceptPrivacyPolicy.value = value ?? false,
              controlAffinity: ListTileControlAffinity.leading,
              subtitle: Text(
                  style: TextStyle(color: Colors.red, fontStyle:FontStyle.italic, fontSize: 8),
                  controller.acceptPrivacyPolicy.value == false
                      ? tNoticeErrorPrivacy
                      : ''
              ),
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
                      : Colors.red
              ),
              secondary: Icon(Icons.hourglass_empty),
              activeColor: Colors.green,
              checkColor: Colors.white,
              value: controller.acceptTerms.value,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onChanged: (value) => controller.acceptTerms.value = value ?? false,
              controlAffinity: ListTileControlAffinity.leading,
              subtitle: Text(
                  style: TextStyle(color: Colors.red, fontStyle:FontStyle.italic, fontSize: 8),
                  controller.acceptTerms.value == false
                      ? tNoticeErrorPrivacy
                      : ''
              ),
            )),

            const SizedBox(height: tFormHeight - 10),

            ///Primary Button for SignUp
            Obx(
                () => TPrimaryButton(
                  privacyPolicy: controller.acceptPrivacyPolicy.value,
                  acceptTerms: controller.acceptTerms.value,
                  isLoading: controller.isLoading.value ? true : false,
                  text: tSignup.tr,
                  onPressed: controller.isFacebookLoading.value || controller.isGoogleLoading.value
                      ? () {}
                      : controller.isLoading.value
                          ? () {}
                          : () {controller.createUser();}
                ),
            ),
          ],
        ),
      ),
    );
  }

} //Class SignUpScreen