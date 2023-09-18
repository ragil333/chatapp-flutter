import 'package:flutter/material.dart';

const int borderColor = 0xffA8B0AF;

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key, required this.methods});
  final List<String> methods;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (String icon in methods)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(borderColor), width: 2),
                  // color: const Color(0xff1A1A1A),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset('assets/images/$icon'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
