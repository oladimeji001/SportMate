import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/screens/forget_pass.dart';
import 'package:sportmate/components/screens/main_menu.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/chg_pass.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/updemail.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/updusername.dart';
import 'package:sportmate/components/screens/start_menu.dart';
import 'package:sportmate/components/screens/verify.dart';
import 'package:sportmate/firebase_options.dart';
import './components/route.dart';
import 'auth_gate.dart';
import 'components/screens/interests.dart';
import 'components/screens/login.dart';
import 'components/screens/menus/settings_privacy/verify_pass.dart';
import 'components/screens/register.dart';

import 'components/screens/username.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.
      initializeApp(name: 'sportmate', options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: Origin()));
}

class Origin extends ConsumerStatefulWidget {
  const Origin({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => Sportmate();
}

class Sportmate extends ConsumerState {

  String? userA;
  @override
  void initState() {
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportMate',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueAccent),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 5, backgroundColor: Colors.black),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
          labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
          labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      routes: {
        sportRoute.start: (context) => const StartMenu(),
        sportRoute.login: (context) => const Login(),
        sportRoute.register: (context) => const Register(),
        sportRoute.username: (context) => const UserNameO(),
        sportRoute.main_menu: (context) => const MainMenu(),
        sportRoute.interests: (context) => const Interest(),
        sportRoute.verify_pass: (context) => const VerifyP(),
        sportRoute.forgot_pass: (context) => const Pass(),
        sportRoute.verify: (context) => const Verify(),
        sportRoute.chgpass: (context) => const ChangePassword(),
        sportRoute.update_email: (context) => const UpdateEmail(),
        sportRoute.update_user: (context) => const UpdateUser(),
      },
      home: const AuthGate(),
      //initialRoute: sportRoute.start,
    );
  }
}
