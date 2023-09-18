import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CallBody extends StatelessWidget {
  const CallBody({
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SvgPicture.asset('assets/svg/line.svg'),
                ),
                const Row(
                  children: [
                    Text(
                      "Recent",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                for (int i = 0; i < 20; i++)
                  Padding(
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alex Linderson",
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/incoming.svg',
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Today. 09:30 AM",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/phone.svg',
                              width: 24,
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            SvgPicture.asset(
                              'assets/svg/video2.svg',
                              width: 24,
                            ),
                          ],
                        )
                      ],
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
