import 'package:best_wordpress_sites/home/data/datasources/templates_fixtures_datasource.dart';
import 'package:best_wordpress_sites/home/data/models/template_model.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TemplatesFixturesDatasource datasource;

  setUp(() {
    datasource = TemplatesFixturesDatasource();
  });

  final templatesData = [
    {
      'id': 'id',
      'templateUrl': 'url',
      'thumbnailUrl': 'thumbUrl',
      'title': 'title',
      'description': 'description',
      'owner_id': 'divi',
      'tags': ['id'],
    }
  ];

  final tTemplates = [
    TemplateModel.fromMap(templatesData[0]),
  ];

  test('should return templates from fixture', () async {
    List<Template> result = datasource.getTemplates(templatesData);
    expect(result, tTemplates);
  });
}
