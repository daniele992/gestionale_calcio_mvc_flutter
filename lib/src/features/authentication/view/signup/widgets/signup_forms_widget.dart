import 'dart:math';

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

  late TextEditingController savePwGenerate;

  @override
  void initState() {
    super.initState();
    savePwGenerate = TextEditingController(text: "Valore iniziale");
  }

  @override
  void dispose() {
    savePwGenerate.dispose(); //Frees memory when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const double fontSize = 12;
    Random random = Random.secure();
    int randomLength = 12; //initial length
    bool acceptPrivacyPolicy = false;
    bool acceptTerms = false;
    String pwGenerate = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String randomSpecialCharacter = "";
    String randomUpperLetter = "";
    String randomNumber = "";

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
                                          randomLength = getRandomNumberBetween(9, 14);//random number between 9/13
                                          randomSpecialCharacter = getRandomSpecialCharacter(); //random special character
                                          randomUpperLetter = getRandomUpperCaseLetter(); //random Upper letter
                                          randomNumber = getRandomNumberBetween(1, 100).toString(); //random number between 1/100
                                          pwGenerate = generatePassword(randomLength, requiredChars: "$randomUpperLetter$randomSpecialCharacter$randomNumber");
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
              noticeError: tNoticeErrorPrivacy,
              textCheckBox: tPrivacy,
              iconCheckBox: Icons.hourglass_empty,
              onChanged: (value) {
                setState(() {
                  acceptPrivacyPolicy = value;
                });
              },
            ),

            ///CheckboxListTile for accept conditions
            FormCheckBoxListTile(
              initialValue: false,
              noticeError: tNoticeErrorConditions,
              textCheckBox: tConditions,
              iconCheckBox: Icons.hourglass_empty,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value;
                });
              },
            ),

            const SizedBox(height: tFormHeight - 10),

            ///Primary Button for SignUp
            Obx(
                () => TPrimaryButton(
                  isLoading: controller.isLoading.value ? true : false,
                  text: tSignup.tr,
                  onPressed: controller.isFacebookLoading.value || controller.isGoogleLoading.value
                      ? () {}
                      : controller.isLoading.value
                          ? () {}
                          : () {controller.createUser(acceptPrivacyPolicy, acceptTerms);
                          print("A" + acceptPrivacyPolicy.toString());
                          print("A" + acceptTerms.toString());
                  }
                ),
            ),
          ],
        ),
      ),
    );
  }

  String generatePassword(int length, {String requiredChars = '', String allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#\$%^&*'}) {

    Random random = Random();
    List<String> password = [];

    //Adds required characters
    password.addAll(requiredChars.split(''));

    //Adds the remaining characters randomly
    for (int i = password.length; i < length; i++) {
      password.add(allowedChars[random.nextInt(allowedChars.length)]);
    }

    //Mix up your password so that you don't always have mandatory characters at the beginning
    password.shuffle();

    //convert a list of strings into a single string.
    return password.join();
  }

  String getRandomUpperCaseLetter(){
    const String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random random = Random();
    return letters[random.nextInt(letters.length)];
  }

  String getRandomSpecialCharacter(){
    const String specialChars = "!@#\$%^&*()_-+=<>?/{}[]|";
    Random random = Random();
    return specialChars[random.nextInt(specialChars.length)];
  }

  int getRandomNumberBetween(int min, int max){
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }


} //Class SignUpScreen