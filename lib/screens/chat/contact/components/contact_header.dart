import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const int backgroundColor = 0xff000E08;

class ContactHeader extends StatelessWidget {
  const ContactHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(0.5),
          height: 44,
          width: 44,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: const Color(backgroundColor),
            child: SvgPicture.asset(
              'assets/svg/search.svg',
              height: 19,
              width: 19,
            ),
          ),
        ),
        const Text(
          "Contact",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0.5),
          height: 44,
          width: 44,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: const Color(backgroundColor),
            child: SvgPicture.asset(
              'assets/svg/user-add.svg',
              height: 19,
              width: 19,
            ),
          ),
        ),
      ],
    );
  }
}
