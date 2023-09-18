import 'package:chatapp/screens/chat/chat.dart';
import 'package:chatapp/screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print("user logout");
            return const Chat();
          } else {
            return const Onboarding();
          }
        },
      ),
    );
  }
}
