import 'package:chatapp/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const int backgroundColor = 0xff000E08;

class SettingHeader extends StatefulWidget {
  const SettingHeader({
    super.key,
  });

  @override
  State<SettingHeader> createState() => _SettingHeaderState();
}

class _SettingHeaderState extends State<SettingHeader> {
  void logout() async {
    final message = await AuthService().logout();
    if (message == "Success") {
      if (!context.mounted) return;
      Navigator.pushNamed(context, "/");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User logout")));
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(0.5),
              height: 44,
              width: 44,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'chat');
                },
                icon: SvgPicture.asset(
                  'assets/svg/back.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/setting.png',
                  height: 82,
                  width: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Jhon Abraham",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Text(
                  "@jhonabraham",
                  style: TextStyle(
                      color: Color.fromARGB(
                        148,
                        255,
                        255,
                        255,
                      ),
                      fontSize: 12),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(0.5),
              height: 44,
              width: 44,
              child: IconButton(
                onPressed: logout,
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 45,
                child: CircleAvatar(
                  minRadius: 45,
                  maxRadius: 45,
                  backgroundColor: const Color(0xff051D13),
                  child: SvgPicture.asset(
                    'assets/svg/message.svg',
                    height: 30,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: CircleAvatar(
                  minRadius: 45,
                  maxRadius: 45,
                  backgroundColor: const Color(0xff051D13),
                  child: SvgPicture.asset(
                    'assets/svg/video.svg',
                    height: 17,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: CircleAvatar(
                  minRadius: 45,
                  maxRadius: 45,
                  backgroundColor: const Color(0xff051D13),
                  child: SvgPicture.asset(
                    'assets/svg/call1.svg',
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: CircleAvatar(
                  minRadius: 45,
                  maxRadius: 45,
                  backgroundColor: const Color(0xff051D13),
                  child: SvgPicture.asset(
                    'assets/svg/dot.svg',
                    height: 4,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
