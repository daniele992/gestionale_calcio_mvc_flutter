import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

///This class handles user registration and can: Validate the input data, Create a new user, Use email or phone for authentication, Save the user in the database, Dynamically update the interface thanks to Rx. It is a complete and central controller for managing the registration flow.
class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final showPassword = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;
  var acceptPrivacyPolicy = false.obs;
  var acceptTerms = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  late final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final pwGenerate = TextEditingController();

  /// Loader
  final isLoading = false.obs;

  // As in the AuthenticationRepository we are calling _setScreen() Method
  // so, whenever there is change in the user state(), screen will be updated.
  // Therefore, when new user is authenticated, AuthenticationRepository() detects
  // the change and call _setScreen() to switch screens

  /// Register New User using either [EmailAndPassword] OR [PhoneNumber] authentication
  Future<void> createUser() async {
    try {
      isLoading.value = true;
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      /// For Phone Authentication
      // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
      // Get.to(() => const OTPScreen());

      // Get User and Pass it to Controller
      final user = UserModel(
        email: email.text.trim(),
        password: password.text.trim(),
        fullName: fullName.text.trim(),
        phoneNo: phoneNo.text.trim(),
        privacyPolicy: acceptPrivacyPolicy.value,
        conditions: acceptTerms.value,
        admin: false
      );

      // Authenticate User first
      final auth = AuthenticationRepository.instance;
      await auth.registerWithEmailAndPassword(user.email, user.password!);
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  /// [PhoneNoAuthentication]
  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    } catch (e) {
      throw e.toString();
    }
  }
}
