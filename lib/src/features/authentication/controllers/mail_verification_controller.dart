import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../constants/text_strings.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../utils/helper/helper_controller.dart';

///This class: Sends (or resends) the verification email to the user, Checks every 3 seconds whether the email has been verified. Also allows for a manual verification check. Automatically redirects the user to the correct screen once the email is verified. It is an essential controller for managing the email verification flow after registration.
class MailVerificationController extends GetxController {
  late Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  /// -- Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  /// -- Set Timer to check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }

  /// -- Manually Check if Verification Completed then Redirect
  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      AuthenticationRepository.instance.setInitialScreen(user);
    }
  }
}
