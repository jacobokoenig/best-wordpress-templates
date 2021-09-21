import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/core/widgets/text/body_1.dart';
import 'package:best_wordpress_sites/core/widgets/text/body_2.dart';
import 'package:best_wordpress_sites/core/widgets/text/heading_1.dart';
import 'package:best_wordpress_sites/core/widgets/text/heading_2.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:bmcommons/bmcommons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TemplatesGrid extends StatelessWidget {
  final HomeLoaded state;

  const TemplatesGrid({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        int crossAxisCount = 3;

        if (constraints.maxWidth < 1000) crossAxisCount = 2;
        if (constraints.maxWidth < 600) crossAxisCount = 1;

        return Container(
          padding: Spacing.largePadding.copyWith(bottom: 0),
          constraints: BoxConstraints(maxWidth: 1000),
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 5 / 7,
            crossAxisSpacing: Spacing.standardSpacing * 1.5,
            mainAxisSpacing: Spacing.standardSpacing * 1.5,
            shrinkWrap: true,
            clipBehavior: Clip.none,
            children: state.filteredTemplates
                .map(
                  (e) => InkWell(
                    onTap: () {
                      launch(e.templateUrl);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.05),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: Spacing.standardPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.45,
                                child: AspectRatio(
                                  aspectRatio: 3 / 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: e.thumbnailUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VerticalSpacing(),
                            Heading2(
                              e.title,
                              fontSize: 26,
                            ),
                            if (e.tags.length > 0)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VerticalSpacing(12),
                                  Chip(
                                    backgroundColor: e.tags.first.color?.withOpacity(0.1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    label: Text(
                                      e.tags.first.title?.toUpperCase() ?? '',
                                      style: body2.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: e.tags.first.color,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            VerticalSpacing(),
                            Body2(e.description),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}
