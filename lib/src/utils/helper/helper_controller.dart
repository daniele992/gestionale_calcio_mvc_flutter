import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import 'package:bad_words/bad_words.dart';


///This class centralizes: validation rules for email, first name, last name, and password; and methods to display popup messages (snackbars) for success, error, warning, or general messages.
class Helper extends GetxController {
  /* -- ============= VALIDATIONS ============= -- */

  ///Checks that the email is not empty and is in a valid format.
  static String? validateEmail(value) {
    if (value == null || value.isEmpty) return tEmailCannotEmpty;
    if (!GetUtils.isEmail(value)) return tInvalidEmailFormat;
    return null;
  }

  ///Checks that the name is not empty. Verifies it contains only letters (a-z, A-Z). Uses the bad_words library to filter offensive words and returns an error if any are found.
  static String? validateNameAndSurname(value){
    final Filter _filter = Filter();
    if(value == null || value.isEmpty) return tNamePlayerCannotEmpty;
    final lettersOnlyRegex = RegExp(r'^[a-zA-Z]+$');
    if (!lettersOnlyRegex.hasMatch(value)) {
      return 'Solo lettere sono permesse';
    }
    // Filters offensive words.
    if (_filter.isProfane(value)) {
      return 'Il testo contiene parole inappropriate';
    }

    return null; //Validation passed.

  }

  ///Checks that the password is not empty and matches a pattern: at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special symbol.
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

  ///Success message with a green background and a check icon.
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

  ///Warning message with an orange background and a warning icon.
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

  ///Error message with a red background and a cross icon.
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

  ///Snackbar for connection error, red background, very long duration, and not manually dismissible.
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

  ///Simpler snackbar with a gray/blue background.
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
