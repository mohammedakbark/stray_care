import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:stray_care/view/const/cheary_toast.dart';
import 'package:stray_care/view/modules/user/user_home.dart';

class UserController with ChangeNotifier {
  bool isShowotpField = false;
  bool showIndicator = false;
  bool startCountDown = true;

  String _verificationId = "";

  OtpFieldController otpBox = OtpFieldController();

  checkMobileNumberLength(String value, context) {
    if (value.length == 10) {
      showIndicator = true;
      _verifyPhoneNumber("+91 $value", context);
      notifyListeners();
    } else {
      isShowotpField = false;
      notifyListeners();
    }
  }

  void showOtpField() {
    isShowotpField = false;
    notifyListeners();
  }

  onStartCountDown(bool value) {
    startCountDown = value;
    isShowotpField = value;
    notifyListeners();
  }

  //------------------authentication
  final auth = FirebaseAuth.instance;

  void _verifyPhoneNumber(String phoneNumber, context) async {
    try {
      await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 59),
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _signUpWithPhoneNumber(credential, context);
          ToastMessage.successToast(context, "Verification Successful");
          log("VERIFICATION - COMPLETED");
        },
        verificationFailed: (FirebaseAuthException e) {
          ToastMessage.errorToast(context, "Verification Failed");
          isShowotpField = false;
          showIndicator = false;
          notifyListeners();

          log("VERIFICATION - FAILED");
        },
        codeSent: (String verificationId, int? resendToken) {
          ToastMessage.successToast(context, "CODE - SEND");
          _verificationId = verificationId;

          onStartCountDown(true);
          log("CODE-SEND");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ToastMessage.warningToast(context, "TIME - OUT");
          showIndicator = false;

          onStartCountDown(false);
          log("TIME_OUT");
        },
      );
    } catch (error) {
      print("Error:-$error");
    }
  }

  verifyOtp(
    otp,
    context,
  ) async {
    if (_verificationId != "") {
      log("Checking OTP");
      showIndicator = true;
      startCountDown = false;
      notifyListeners();
      try {
        final credential = PhoneAuthProvider.credential(
            verificationId: _verificationId, smsCode: otp);
        _signUpWithPhoneNumber(credential, context);
      } catch (error) {
        showIndicator = false;
        otpBox.clear();
        notifyListeners();
        return ToastMessage.errorToast(context, "Error,$error");
      }
    } else {
      log("verification Id is missing");
    }
  }

  Future _signUpWithPhoneNumber(PhoneAuthCredential credential, context) async {
    await auth.signInWithCredential(credential).then((value) {
      showIndicator = false;

      if (value.user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const UserHome(),
            ),
            (route) => false);
      } else {
        ToastMessage.errorToast(context, "Somthing went wrong");
      }

      notifyListeners();
    });
  }

  // -------------------------------------
 static  List<String> animalType = [
    "Wonded Animal",
    "Aggressive Animal",
    "Wild Animal",
    "Abuse Towards Animal"
  ];
}