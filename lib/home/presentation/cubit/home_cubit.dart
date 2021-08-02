import 'package:best_wordpress_sites/home/data/fixtures/tag_taxonomy.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/usecases/complete_tags.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetTemplates getTemplates;
  CompleteTags completeTags;

  HomeCubit({
    required this.getTemplates,
    required this.completeTags,
  }) : super(HomeInitial()) {
    _init();
  }

  _init() async {
    emit(HomeLoading());
    List<Template> templates = await getTemplates();
    templates = templates.map((e) => e.copyWith(tags: completeTags(e.tags))).toList();
    emit(
      HomeLoaded(
        templates: templates,
        filteredTemplates: templates,
        tags: [allTag, ...tagTaxonomy],
        selectedFilter: allTag,
      ),
    );
  }

  filter(Tag tag) {
    var state = this.state;
    if (!(state is HomeLoaded)) return;

    List<Template> filteredTemplates;

    if (tag.id == 'all') {
      filteredTemplates = state.templates;
    } else {
      filteredTemplates = state.templates.where((element) => element.tags.contains(tag)).toList();
    }

    emit(
      HomeLoaded(
        templates: state.templates,
        filteredTemplates: filteredTemplates,
        tags: [allTag, ...tagTaxonomy],
        selectedFilter: tag,
      ),
    );
  }
}
