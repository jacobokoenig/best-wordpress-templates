import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/core/widgets/text/body_1.dart';
import 'package:best_wordpress_sites/core/widgets/text/heading_2.dart';
import 'package:best_wordpress_sites/core/widgets/text/title.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  final HomeLoaded state;

  const HeaderView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.standardPadding,
      decoration: BoxDecoration(
        color: lightGray,
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Heading2('untheme'),
          ),
          VerticalSpacing(50),
          TitleText(
            'Beautiful Curated Wordpress Themes',
            textAlign: TextAlign.center,
          ),
          VerticalSpacing(),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Body1(
                'Beautiful layouts by the best theme designers for Wordpress to help you create sharp websites with little effort',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          VerticalSpacing(),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: state.tags
                    .map(
                      (e) => Chip(
                        backgroundColor: state.selectedFilter == e ? e.color : lightGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: e.color ?? black,
                            width: 2,
                          ),
                        ),
                        label: Text(
                          e.title?.toUpperCase() ?? '',
                          style: body2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: state.selectedFilter == e ? lightGray : e.color,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          VerticalSpacing(100),
        ],
      ),
    );
  }
}
