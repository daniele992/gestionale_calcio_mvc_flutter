import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/player_model.dart';

class InsertPlayersController extends GetxController {
  static InsertPlayersController get instance => Get.find();

  // --- PERSONAL DATE INSERT PLAYERS --- //
  final name = TextEditingController();
  final surname = TextEditingController();
  final dateOfBirthday = TextEditingController();
  final team = TextEditingController();
  final continent = TextEditingController();

  // --- PHYSICAL DATE INSERT PLAYERS --- //
  final height = TextEditingController();
  final weight = TextEditingController();
  final somatotype = TextEditingController();
  final biotype =  TextEditingController();
  final preferredFoot = RxnString();


  final isLoading = false.obs;
  GlobalKey<FormState> playersFormKey = GlobalKey<FormState>();

  /// Register New User using either [EmailAndPassword] OR [PhoneNumber] authentication
  /*Future<void> createPlayer() async {
    try {
      isLoading.value = true;
      if (!playersFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      /// For Phone Authentication
      // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
      // Get.to(() => const OTPScreen());

      // Get User and Pass it to Controller
      final player = PlayerModel(
          /*email: email.text.trim(),
          password: password.text.trim(),
          fullName: fullName.text.trim(),
          phoneNo: phoneNo.text.trim(),
          privacyPolicy: acceptPrivacyPolicy.value,
          conditions: acceptTerms.value,
          admin: false */
          personalDate:PersonalDate(
              name: name.text.trim(),
              surname: surname.text.trim(),
              dateOfBirth: dateOfBirthday.text.trim(),

          ),

      );

      // Authenticate User first
     /* final auth = AuthenticationRepository.instance;
      await auth.registerWithEmailAndPassword(user.email, user.password!);
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5)); */
    } */



}