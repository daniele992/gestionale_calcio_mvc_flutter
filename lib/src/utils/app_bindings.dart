import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/login_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/otp_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/signup_controller.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:gestionale_calcio_mvc_flutter/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

///It extends the Bindings class from GetX, a Flutter library for state and dependency management.
///It is used to define which dependencies (controllers, repositories, services) should be loaded and made automatically and centrally available when the app starts. It centralizes the registration of dependencies.
class InitialBinding extends Bindings {
  @override
  void dependencies() {

    //With lazyPut, the dependency is created only on first use and not at startup.
    //With fenix, if the dependency is removed from memory, it is automatically recreated when requested again.
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);

    Get.lazyPut(() => OnBoardingController(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => OTPController(), fenix: true);
  }
}
