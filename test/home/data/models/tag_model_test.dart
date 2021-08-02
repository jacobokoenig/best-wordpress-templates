import 'package:best_wordpress_sites/home/data/models/tag_model.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTagModel = TagModel('id');

  test(
    'should be a subclass of the Tag entity',
    () async {
      // assert
      expect(tTagModel, isA<Tag>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when passed a JSON',
      () async {
        // arrange
        final Map<String, dynamic> map = {'id': 'id'};

        // act
        final result = TagModel.fromMap(map);

        // assert
        expect(result, tTagModel);
      },
    );
  });
}
