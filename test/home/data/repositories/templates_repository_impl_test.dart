import 'package:best_wordpress_sites/home/data/datasources/templates_fixtures_datasource.dart';
import 'package:best_wordpress_sites/home/data/repositories/templates_repository_impl.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'templates_repository_impl_test.mocks.dart';

@GenerateMocks([TemplatesFixturesDatasource])
void main() {
  late TemplatesRepositoryImpl repository;
  late MockTemplatesFixturesDatasource mockTemplatesLocalDatasource;

  setUp(() {
    mockTemplatesLocalDatasource = MockTemplatesFixturesDatasource();
    repository = TemplatesRepositoryImpl(mockTemplatesLocalDatasource);
  });

  final tTemplates = [
    Template(
      id: 'id',
      templateUrl: 'url',
      thumbnailUrl: 'thumbUrl',
      title: 'title',
      description: 'description',
      owner: 'divi',
      tags: [Tag('id')],
    ),
  ];

  test('should return templates from local datasource', () async {
    when(mockTemplatesLocalDatasource.getTemplates(any)).thenAnswer((_) => tTemplates);

    List<Template> result = await repository.getTemplates();

    expect(result, tTemplates);
    verify(mockTemplatesLocalDatasource.getTemplates(any));
    verifyNoMoreInteractions(mockTemplatesLocalDatasource);
  });
}
