import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app/exceptions/signupEmailPassword_Failure.dart';
import 'package:todo_app/views/Password/verification.dart';
import 'package:todo_app/views/logIn/logIn.dart';
import 'package:todo_app/views/screenS/mainPage.dart';

class Authenticationrepository extends GetxController {
  static Authenticationrepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  var verificatonId = ''.obs;

  // Observable to store error messages
  var errorMessage = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 4));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => Login()) : Get.offAll(() => Mainpage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => Mainpage())
          : Get.offAll(() => Login());
    } on FirebaseAuthException catch (e) {
      final ex = SignupemailpasswordFailure.code(e.code);
      errorMessage.value = ex.message; // Update error message
      SignupErrorWidget();
      print("Exception Catched: ${ex.message}");
      // Get.snackbar("Signup Failed", ex.message,
      //     backgroundColor: Colors.redAccent,
      //     colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM);

      throw ex;
    } catch (_) {
      const ex = SignupemailpasswordFailure();
      errorMessage.value = ex.message; // Update error message
      SignupErrorWidget();
      print("Exception2 Catched: ${ex.message}");
      // Get.snackbar("Signup Failed", ex.message,
      //     backgroundColor: Colors.redAccent,
      //     colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM);

      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Exception Catched: ${e}");
    } catch (_) {
      print("Exception2 Catched:");
    }
  }

  Future<void> logout() async => _auth.signOut();

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (VerificationId, resendToken) {
        this.verificatonId.value = verificatonId as String;
      },
      codeAutoRetrievalTimeout: (VerificationId) {
        this.verificatonId.value = verificatonId as String;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error!', 'Invalid phone number');
        } else {
          Get.snackbar('Error!', 'Something went wrong, Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificatonId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}

class SignupErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final error = Authenticationrepository().errorMessage.value;
      if (error.isEmpty) return SizedBox.shrink();

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  error,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () =>
                    Authenticationrepository().errorMessage.value = '',
              ),
            ],
          ),
        ),
      );
    });
  }
}
