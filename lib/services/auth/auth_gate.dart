import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_app/pages/home_page.dart';
import 'package:uts_app/services/auth/login_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user login
          if (snapshot.hasData) {
            return const HomePage();
          }

          // if user not login
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
