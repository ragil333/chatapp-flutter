import 'package:chatapp/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

final List<String> methods = ["google.png", "facebook.png", "apple-black.png"];

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool show = false;
  bool showConfirm = false;

  void showPasswod() {
    setState(() {
      show = !show;
    });
  }

  void showConfirmPasswod() {
    setState(() {
      showConfirm = !showConfirm;
    });
  }

  void registeration() async {
    if (_passwordController.text != _passwordConfirmController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password not the same")));
      return;
    }
    final auth = Provider.of<AuthService>(context, listen: false);
    try {
      await auth.registration(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);
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
                  "Sign up with Email",
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
                    "Get chatting with friends and family today by signing up for our chat app!"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Name",
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
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
                padding: const EdgeInsets.only(top: 40),
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
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hintText: "",
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirm Password",
                    ),
                    TextField(
                      controller: _passwordConfirmController,
                      obscureText: !showConfirm,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showConfirmPasswod,
                          icon: show
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hintText: "",
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  height: 48, // <-- m
                  child: ElevatedButton(
                    onPressed: registeration,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: const Color(0xff24786D),
                    ),
                    child: const Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
