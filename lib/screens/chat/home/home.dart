import 'package:chatapp/screens/chat/home/components/home_body.dart';
import 'package:chatapp/screens/chat/home/components/home_header.dart';
import 'package:chatapp/screens/chat/home/components/user_story.dart';
import 'package:flutter/material.dart';

const int backgroundColor = 0xff000E08;

class Home extends StatelessWidget {
  const Home({
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
              HomeHeader(),
              UserStory(),
            ],
          ),
        ),
        HomeBody()
      ],
    );
  }
}
