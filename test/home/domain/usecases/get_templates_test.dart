import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/repositories/templates_repository.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_templates_test.mocks.dart';

@GenerateMocks([TemplatesRepository])
void main() {
  late GetTemplates usecase;
  late MockTemplatesRepository mockTemplatesRepository;

  setUp(() {
    mockTemplatesRepository = MockTemplatesRepository();
    usecase = GetTemplates(mockTemplatesRepository);
  });

  final tTemplates = [
    Template(
      id: 'id',
      templateUrl: 'url',
      thumbnailUrl: 'thumbUrl',
      title: 'title',
      description: 'description',
      tags: [Tag(id: 'id', title: 'title', color: Colors.white)],
    ),
  ];

  test('should get templates from the repository', () async {
    when(mockTemplatesRepository.getTemplates()).thenAnswer((_) async => tTemplates);

    List<Template> result = await usecase();

    expect(result, tTemplates);
    verify(mockTemplatesRepository.getTemplates());
    verifyNoMoreInteractions(mockTemplatesRepository);
  });
}
