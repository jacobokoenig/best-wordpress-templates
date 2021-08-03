import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/core/widgets/text/body_1.dart';
import 'package:best_wordpress_sites/core/widgets/text/heading_2.dart';
import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.largePadding * 1.5,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Heading2('untheme'),
                  ),
                ),
                VerticalSpacing(40),
                Heading2(
                  '📫 Contact Me',
                ),
                VerticalSpacing(),
                Body1(
                  '✉️ jacobo@binarymango.com',
                ),
                VerticalSpacing(8),
                Body1(
                  '📱 +1 (305) 770-8249',
                ),
                VerticalSpacing(60),
              ],
            ),
          ),
          HorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VerticalSpacing(60),
                VerticalSpacing(40),
                Heading2(
                  'ℹ️ About untheme',
                ),
                VerticalSpacing(),
                Body1(
                  'untheme is a non for profit made just for fun. If you found it useful, show some love with the "Buy me coffee" button 😁',
                ),
                VerticalSpacing(60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
