import 'package:best_wordpress_sites/home/data/datasources/templates_fixtures_datasource.dart';
import 'package:best_wordpress_sites/home/data/fixtures/templates_data.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/repositories/templates_repository.dart';

class TemplatesRepositoryImpl implements TemplatesRepository {
  final TemplatesFixturesDatasource templateLocalDatasource;

  TemplatesRepositoryImpl(this.templateLocalDatasource);

  @override
  Future<List<Template>> getTemplates() async {
    //TODO: Handle errors
    return templateLocalDatasource.getTemplates(templatesData);
  }
}
