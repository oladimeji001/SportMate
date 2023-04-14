import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/firebasestorage.dart';
import 'package:sportmate/components/screens/pickimageFromGallery.dart';
import 'package:sportmate/components/route.dart';

import '../screens/register.dart';

String? _verificationId;

//String? get verificationId => _verificationId;

final authProvider = Provider((ref) => AuthBase(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthBase {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthBase({required this.auth, required this.firestore});

  void phoneVerification(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
            await auth.currentUser!.updatePhoneNumber(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            throw Exception(exception.message);
          },
          codeSent: (String verificationId, int? resendToken) {
            _verificationId = verificationId;
            //Transfer verificationId for verifyOTP
          },
          codeAutoRetrievalTimeout: (String message) {});
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void emailSignUp(BuildContext context, String email, String password,
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required TextEditingController phoneController,
      required TextEditingController emailController,
      required var phoneCode}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String uid = auth.currentUser!.uid;
      await firestore.collection('users').doc(uid).set({
        'firstname': firstName,
        'lastname': lastName,
        'phone-number': phoneNumber
      });
      Navigator.pushNamed(context, '/verify',
          arguments: FormDetail(emailController, phoneController, phoneCode));
    } on FirebaseException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void emailSignIn(BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamed(sportRoute.main_menu);
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void emailVerification(BuildContext context, String email) async {
    try {
      await auth.currentUser!.sendEmailVerification();
      showSnackBar(context: context, content: 'Verification link Sent');
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void forgetPass(BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackBar(context: context, content: 'Verification Link sent');
    } on FirebaseException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void changePass(BuildContext context, String newPassword) async {
    try {
      await auth.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (exc) {
      showSnackBar(
          context: context,
          content: exc.toString().replaceAll('firebase_auth\\', ''));
    }
  }

  void updateEmail(BuildContext context, String newEmail) async {
    try {
      await auth.currentUser?.updateEmail(newEmail);
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void updateUsername(BuildContext context, String newUsername) async {
    try {
      await auth.currentUser?.updateDisplayName(newUsername);
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  Future<void> uploadInterests(
      BuildContext context, List<String> interests) async {
    try {
      String uid = auth.currentUser!.uid;

      await firestore
          .collection('users')
          .doc(uid)
          .update({'interests': interests});
      Navigator.pushNamed(context, sportRoute.username);
    } on FirebaseException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void verifyOTP(
      {required BuildContext context,
      // required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: userOTP); //userOTP is from user input

      await auth.signInWithCredential(credential);
      Navigator.of(context).pushReplacementNamed(sportRoute.interests);
      //Navigator.of(context).pushNamedAndRemoveUntil() add to onchanged otp verification
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  Future<void> profileUpload(BuildContext context,
      {required File profilePics,
      required String userName,
      required ProviderRef ref}) async {
    try {
      String uid = auth.currentUser!.uid;
      String? photoUrl;
      photoUrl = await ref
          .read(commonFirebaseStorageProvider)
          .storeFileToFirebase('profilePic/$uid', profilePics);
      await firestore
          .collection('users')
          .doc(uid)
          .update({'profile_pics': photoUrl, 'username': userName});
      await auth.currentUser!.updateDisplayName(userName);
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void verifyUser(BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void signOut(BuildContext context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }
}
