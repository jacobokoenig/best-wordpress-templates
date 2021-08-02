import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Body1 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const Body1(this.text, {Key? key, this.textAlign}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: body1, textAlign: textAlign);
  }
}
