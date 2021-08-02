import 'package:get_it/get_it.dart';
import 'package:best_wordpress_sites/home/data/datasources/templates_fixtures_datasource.dart';
import 'package:best_wordpress_sites/home/data/fixtures/tag_taxonomy.dart';
import 'package:best_wordpress_sites/home/data/repositories/templates_repository_impl.dart';
import 'package:best_wordpress_sites/home/domain/usecases/complete_tags.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance..allowReassignment = true;

init() async {
  //DataSources
  sl.registerFactory(() => TemplatesFixturesDatasource());

  //Repositories
  sl.registerFactory(() => TemplatesRepositoryImpl(sl()));

  //Usecases
  sl.registerFactory(() => GetTemplates(sl<TemplatesRepositoryImpl>()));
  sl.registerFactory(() => CompleteTags(tagTaxonomy));

  //Cubits
  sl.registerLazySingleton(() => HomeCubit(getTemplates: sl(), completeTags: sl()));
}
