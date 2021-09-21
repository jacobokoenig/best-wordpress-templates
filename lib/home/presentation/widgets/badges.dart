import 'package:bmcommons/bmcommons.dart';
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
            width: 200,
          ),
        ),
        VerticalSpacing(8),
        InkWell(
          onTap: () {
            launch(
              'https://www.producthunt.com/posts/untheme?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-untheme',
            );
          },
          child: Image.asset(
            'assets/icons/ph-button.png',
            // height: 54,
            width: 200,
          ),
        ),
      ],
    );
  }
}
