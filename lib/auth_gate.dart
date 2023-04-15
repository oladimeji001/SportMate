import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/main_menu.dart';
import 'package:sportmate/components/screens/start_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const StartMenu();
          }

          return const MainMenu();
          // Render your application if authenticated
        },
      );
    } on Exception {
      return const StartMenu();
    }
  }
}
