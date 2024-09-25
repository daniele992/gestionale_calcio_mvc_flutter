import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/welcome/welcome_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/dashboard.dart';
import 'package:get/get.dart';

import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  //Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserWithEmailPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.off(() => const Dashboard()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex =  SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
    catch(_){
      const ex =  SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  /*Future<void> loginWithEmailPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){}
    catch(_){}
  }*/

  Future<void> logout() async => await _auth.signOut();


}