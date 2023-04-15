import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/main_menu.dart';
import 'package:sportmate/components/screens/start_menu.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try{
      return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const MainMenu();
          }

          // Render your application if authenticated
          return const StartMenu();
        },
      );
    } on Exception{
      return const StartMenu();
    }
  }
}