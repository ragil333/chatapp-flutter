import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 24, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SvgPicture.asset('assets/svg/line.svg'),
                ),
                for (int i = 0; i < 20; i++)
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'message');
                      },
                      splashColor: Colors.amber,
                      child: Ink(
                        color: Colors.white,
                        child: const ChatMessage(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(0.5),
            height: 52,
            width: 52,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alex Linderson",
                style: TextStyle(fontSize: 20),
              ),
              Text("How are you today")
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("2 min ago"),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 21,
                  height: 21,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffF04A4C),
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
