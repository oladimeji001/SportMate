import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/screens/main_menu.dart';
import 'package:sportmate/components/screens/start_menu.dart';
import './components/route.dart';
import 'components/screens/login.dart';
import 'components/screens/register.dart';

void main() {
  runApp(const ProviderScope(child: Sportmate()));
}

class Sportmate extends StatelessWidget {
  const Sportmate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5,
            backgroundColor: Colors.black),
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
        sportRoute.main_menu: (context) => const MainMenu()
      },
      initialRoute: sportRoute.start,
    );
  }
}
