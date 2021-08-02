import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            launch('https://www.buymeacoffee.com/jacobok');
          },
          child: Image.asset(
            'assets/icons/bmc-button.png',
            height: 50,
          ),
        ),
      ],
    );
  }
}
