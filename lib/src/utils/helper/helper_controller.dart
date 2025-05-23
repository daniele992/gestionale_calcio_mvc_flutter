import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import 'package:bad_words/bad_words.dart';

class Helper extends GetxController {
  /* -- ============= VALIDATIONS ============= -- */

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) return tEmailCannotEmpty;
    if (!GetUtils.isEmail(value)) return tInvalidEmailFormat;
    return null;
  }

  static String? validateNameAndSurname(value){
    final Filter _filter = Filter();
    if(value == null || value.isEmpty) return tNamePlayerCannotEmpty;
    final lettersOnlyRegex = RegExp(r'^[a-zA-Z]+$');
    if (!lettersOnlyRegex.hasMatch(value)) {
      return 'Solo lettere sono permesse';
    }
    // Filtra le parole offensive
    if (_filter.isProfane(value)) {
      return 'Il testo contiene parole inappropriate';
    }

    return null; // Validazione passata

  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must be 8 characters, with an uppercase letter, number and symbol';
    }
    return null;
  }

  /* -- ============= SNACK-BARS ================ -- */

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.check_circle, color: tWhiteColor),
    );
  }

  static warningSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.exclamation_circle_solid,
          color: tWhiteColor),
    );
  }

  static errorSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.times_circle, color: tWhiteColor),
    );
  }

  static void errorConnectivity({required String title}) {
    Get.snackbar(
        'Errore',
        title,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        //duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(tDefaultSpace - 10),
        isDismissible: false,
        duration: const Duration(days: 1),
    );
  }

  static modernSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.blueGrey,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
    );
  }
}
