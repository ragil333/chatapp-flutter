import 'package:chatapp/auth/auth.dart';
import 'package:chatapp/screens/components/login_method.dart';
import 'package:chatapp/screens/components/or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

final List<String> methods = ["google.png", "facebook.png", "apple-black.png"];
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool show = false;
  void showPasswod() {
    setState(() {
      show = !show;
    });
  }

  @override
  // ignore: must_call_super
  initState() {
    _emailController.clear();
    _passwordController.clear();
  }

  void login() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    try {
      await auth.login(
          email: _emailController.text, password: _passwordController.text);
      if (context.mounted) Navigator.of(context).pop();
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/back.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  "Login in to Chatbox",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 41, right: 41, top: 16),
                child: Text(
                    textAlign: TextAlign.center,
                    "Welcome back! Sign in using your social \naccount or email to continue us"),
              ),
              LoginMethod(methods: methods),
              const or(
                fontColor: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Email",
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          hintText: "",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: !show,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: showPasswod,
                            icon: show
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          hintText: "",
                          enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  height: 48, // <-- m
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: const Color(0xff24786D),
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
