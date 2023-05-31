import 'package:flutter/material.dart';

class SocialButtns extends StatelessWidget {
  const SocialButtns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/fb.png")),
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/linkedin.png")),
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/twitter.png")),
      ],
    );
  }
}
