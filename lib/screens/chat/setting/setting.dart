import 'package:chatapp/screens/chat/setting/components/setting_body.dart';
import 'package:chatapp/screens/chat/setting/components/setting_header.dart';
import 'package:flutter/material.dart';

const int backgroundColor = 0xff000E08;

class Setting extends StatefulWidget {
  const Setting({
    super.key,
  });

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
              SettingHeader(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SettingBody(),
      ],
    );
  }
}
