import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/view/welcome/welcome_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/dashboard.dart';
import 'package:get/get.dart';

import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady(){
    //Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// Setting initial screen onLOAD
  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());
  }

  /// Phone Authentication
  loginWithPhoneNo(String phoneNumber) async {
    try {
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch(e){
      if(e.code == 'invalid-phone-number'){
        Get.snackbar("Error", "Invalid Phone No");
      }
    } catch(_) {
      Get.snackbar("Error", "Something went wrong.");
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async{
          await _auth.signInWithCredential(credential);
        } ,
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if(e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The provided phone number is not valid.');
          }else{
            Get.snackbar('Error', 'Something went wrong. Try again.');
          }
        },
    );
  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user !=null ? true : false;
  }

  Future<String?> createUserWithEmailPassword(String email, String password) async{
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

  Future<String?> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){}
    catch(_){}
  }

  Future<void> logout() async => await _auth.signOut();


}