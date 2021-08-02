import 'package:best_wordpress_sites/home/data/models/tag_model.dart';
import 'package:best_wordpress_sites/home/data/models/template_model.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTemplateModel = TemplateModel(
    id: 'id',
    templateUrl: 'url',
    thumbnailUrl: 'thumbUrl',
    title: 'title',
    description: 'description',
    owner: 'divi',
    tags: [TagModel('id')],
  );

  test(
    'should be a subclass of the Template entity',
    () async {
      // assert
      expect(tTemplateModel, isA<Template>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when passed a JSON',
      () async {
        // arrange
        final Map<String, dynamic> map = {
          'id': 'id',
          'templateUrl': 'url',
          'thumbnailUrl': 'thumbUrl',
          'title': 'title',
          'description': 'description',
          'owner_id': 'divi',
          'tags': ['id'],
        };

        // act
        final result = TemplateModel.fromMap(map);
        // assert
        expect(result, tTemplateModel);
      },
    );
  });
}
