import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/firebasestorage.dart';
import 'package:sportmate/components/screens/pickimageFromGallery.dart';
import 'package:sportmate/components/route.dart';

final authProvider = Provider((ref) => AuthBase(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class AuthBase {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthBase({required this.auth, required this.firestore});

  void phoneVerification(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            throw Exception(exception.message);
          },
          codeSent: (String verificationId, int? resendToken) {
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
      required ProviderRef ref}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String uid = auth.currentUser!.uid;
      firestore.collection('users').doc(uid).set({
        'firstname': firstName,
        'lastname': lastName,
        'phone-number': phoneNumber
      });
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
    } on FirebaseAuthException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void forgetPass(BuildContext context, String email) async {
    try {
      auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (exc) {
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
          .set({'interests': interests});
    } on FirebaseException catch (exc) {
      showSnackBar(context: context, content: exc.toString());
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: userOTP); //userOTP is from user input
      await auth.signInWithCredential(credential);
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
          .set({'profile_pics': photoUrl, 'username': userName});
      await auth.currentUser!.updateDisplayName(userName);
    } on FirebaseAuthException catch (exc) {
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
