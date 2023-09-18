// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class or extends StatelessWidget {
  const or({super.key, required this.fontColor});

  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.3,
            width: 160,
            color: fontColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "OR",
              style: TextStyle(fontSize: 14, color: fontColor),
            ),
          ),
          Container(
            height: 0.3,
            width: 160,
            color: fontColor,
          ),
        ],
      ),
    );
  }
}
