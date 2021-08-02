part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Template> templates;
  final List<Tag> tags;
  final Tag? selectedFilter;

  HomeLoaded({
    required this.templates,
    required this.tags,
    this.selectedFilter,
  });

  @override
  List<Object> get props => [templates, tags];
}
