import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/forget_password/forget_password_otp/otp_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call this Function from design e they will do the rest
  void registerUser(String email, String password){
    String? error = AuthenticationRepository.instance.createUserWithEmailPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  //Get phoneNo from user and pass it to auth Repository for Firebase Authentication
  Future<void> createUser(UserModel user) async {
   await userRepo.createUser(user);
   phoneAuthentication(user.phoneNo);
   Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }



}