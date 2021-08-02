part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Template> templates;

  HomeLoaded({required this.templates});

  @override
  List<Object> get props => [templates];
}
