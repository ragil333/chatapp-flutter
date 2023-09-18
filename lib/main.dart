import 'package:chatapp/auth/auth.dart';
import 'package:chatapp/auth/auth_gate.dart';
import 'package:chatapp/screens/chat/chat.dart';
import 'package:chatapp/screens/login/login.dart';
import 'package:chatapp/screens/message/message.dart';
import 'package:chatapp/screens/onboarding.dart';
import 'package:chatapp/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => AuthService(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        'onboarding': (context) => const Onboarding(),
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'chat': (context) => const Chat(),
        'message': (context) => const Message(),
      },
    );
  }
}
