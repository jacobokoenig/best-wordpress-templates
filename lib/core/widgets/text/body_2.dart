import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Body2 extends StatelessWidget {
  final String text;

  const Body2(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: body2);
  }
}
