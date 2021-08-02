import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Heading3 extends StatelessWidget {
  final String text;

  const Heading3(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: heading3);
  }
}
