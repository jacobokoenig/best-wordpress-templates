import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/core/widgets/text/body_1.dart';
import 'package:best_wordpress_sites/core/widgets/text/heading_2.dart';
import 'package:best_wordpress_sites/core/widgets/text/title.dart';
import 'package:best_wordpress_sites/get_it.dart';
import 'package:best_wordpress_sites/home/data/fixtures/tag_taxonomy.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final HomeCubit _cubit = sl.get();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) return _buildLoadingScreen();
            if (state is HomeLoaded) return _buildLoadedScreen(context, state);
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedScreen(BuildContext context, HomeLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: Spacing.standardPadding,
            height: 800,
            color: lightGray,
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
                        children: state.tags
                            .map(
                              (e) => Chip(
                                backgroundColor: state.selectedFilter == e ? e.color : lightGray,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color:
                                        state.selectedFilter == e ? lightGray : (e.color ?? black),
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
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
