import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/get_it.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:best_wordpress_sites/home/presentation/widgets/header_view.dart';
import 'package:best_wordpress_sites/home/presentation/widgets/templates_grid/templates_grid.dart';
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
            offset: Offset(0, -120),
            child: TemplatesGrid(state: state),
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
