import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sportmate/components/controller/auth.dart';
import 'dart:io';

import '../screens/menus/settings_privacy.dart';

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

  void verifyOTP(BuildContext context, /**String verificationId,**/ String userOTP) {
    authBase.verifyOTP(
        context: context, /**verificationId: verificationId,**/ userOTP: userOTP);
  }

  void emailSignUp(
      BuildContext context,
      String email,
      String password,
      String firstName,
      String lastName,
      String phoneNumber,
      TextEditingController phoneController,
      TextEditingController emailController,
      var phoneCode) async {
    authBase.emailSignUp(context, email, password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        phoneController: phoneController,
        emailController: emailController,
        phoneCode: phoneCode);
  }

  void emailSignIn(BuildContext context, String email, String password) {
    authBase.emailSignIn(context, email, password);
  }

  void emailVerification(BuildContext context, String email) {
    authBase.emailVerification(context, email);
  }

  void forgetPass(BuildContext context, String email) {
    authBase.forgetPass(context, email);
  }

  void changePass(BuildContext context, String password) {
    authBase.changePass(context, password);
  }

  void updateEmail(BuildContext context, String newEmail) {
    authBase.updateEmail(context, newEmail);
  }

  void updateUsername(BuildContext context, String newUsername) {
    authBase.updateUsername(context, newUsername);
  }

  void uploadInterests(BuildContext context, List<String> interests) {
    authBase.uploadInterests(context, interests);
  }

  void profileUpload(BuildContext context, File profilePics, String userName) {
    authBase.profileUpload(context,
        profilePics: profilePics, userName: userName, ref: ref);
  }

  void profilePicsUpload(BuildContext context, File profilePics,){
    authBase.profilePicsUpload(context, profilePics: profilePics, ref: ref);
  }

  void verifyUser(BuildContext context, String password, SettingItems settingD){
    authBase.verifyUser(context, password, settingD);
  }

  void signOut(BuildContext context) {
    authBase.signOut(context);

  }

  Future<String?> getProfile(BuildContext context) async {
    final profile = authBase.getProfile(context);
    return profile;
  }
  String? getUserName(BuildContext context){
    final userName = authBase.getUserName(context);
    return userName;
  }

  String? getphoneNumber(BuildContext context){
    final phoneNumber = authBase.getphoneNumber(context);
    return phoneNumber;
  }

  Future interests(BuildContext context){
      final interests = authBase.interests(context);
      return interests;
  }
  String? getEmailAddress(BuildContext context){
    final emailAddress= authBase.getEmailAddress(context);
    return emailAddress;
  }
}
