import 'package:chatapp/screens/chat/calls/components/call_body.dart';
import 'package:chatapp/screens/chat/calls/components/call_header.dart';
import 'package:flutter/material.dart';

const int backgroundColor = 0xff000E08;

class Call extends StatelessWidget {
  const Call({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //header
        Padding(
          padding: EdgeInsets.only(top: 61, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CallHeader(),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        CallBody()
      ],
    );
  }
}
