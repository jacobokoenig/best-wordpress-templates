import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/get_it.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:best_wordpress_sites/home/presentation/widgets/header_view.dart';
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
          HeaderView(state: state),
          Transform.translate(
            offset: Offset(0, -100),
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                int crossAxisCount = 3;

                if (constraints.maxWidth < 1000) crossAxisCount = 2;
                if (constraints.maxWidth < 600) crossAxisCount = 1;

                return Container(
                  padding: Spacing.largePadding,
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: Spacing.standardSpacing * 1.5,
                    mainAxisSpacing: Spacing.standardSpacing * 1.5,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    children: state.filteredTemplates
                        .map((e) => Container(
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
                            ))
                        .toList(),
                  ),
                );
              }),
            ),
          )
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
