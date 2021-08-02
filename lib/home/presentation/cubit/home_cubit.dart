import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetTemplates getTemplates;

  HomeCubit(this.getTemplates) : super(HomeInitial());
}
