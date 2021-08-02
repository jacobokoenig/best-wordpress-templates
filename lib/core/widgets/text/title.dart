import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TitleText(this.text, {Key? key, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: title,
      textAlign: textAlign,
    );
  }
}
