import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sportmate/components/controller/auth.dart';
import 'dart:io';

final authControllerProvider = Provider((ref) {
  final authBase = ref.watch(authProvider);
  return AuthController(authBase: authBase, ref: ref);
});

class AuthController {
  final AuthBase authBase;
  final ProviderRef ref;

  AuthController({required this.authBase, required this.ref});

  void phoneVerification(BuildContext context, String phoneNumber) {
    authBase.phoneVerification(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP){
    authBase.verifyOTP(context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void emailSignUp(BuildContext context, String email, String password,
      String firstName, String lastName, String phoneNumber, ProviderRef ref) async {
    authBase.emailSignUp(context, email, password,
        firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, ref: ref);
  }

  void emailSignIn(BuildContext context, String email, String password) {
    authBase.emailSignIn(context, email, password);
  }

  void emailVerification(BuildContext context, String email) {
    authBase.emailVerification(context, email);
  }

  void forgetPass(BuildContext context, String newPassword){
    authBase.forgetPass(context, newPassword);
  }

  void changePass(BuildContext context, String email) {
    authBase.changePass(context, email);
  }

  void updateEmail(BuildContext context, String newEmail) {
    authBase.updateEmail(context, newEmail);
  }

  void updateUsername(BuildContext context, String newUsername) {
    authBase.updateUsername(context, newUsername);
  }
void uploadInterests(BuildContext context, List<String> interests){
    authBase.uploadInterests(context, interests);
}
  void profileUpload(BuildContext context, File profilePics, String userName) {
    authBase.profileUpload(context, profilePics: profilePics, userName: userName, ref: ref);
  }
  void signOut(BuildContext context) {
    authBase.signOut(context);
  }
}
