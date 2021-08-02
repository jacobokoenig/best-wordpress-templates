import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/repositories/templates_repository.dart';
import 'package:best_wordpress_sites/home/domain/usecases/complete_tags.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_templates_test.mocks.dart';

void main() {
  late CompleteTags usecase;

  List<Tag> tags = [
    Tag('tag', title: 'Tag', color: green),
    Tag('tag2', title: 'Tag2', color: purple),
    Tag('tag3', title: 'Tag3', color: black),
  ];

  setUp(() {
    usecase = CompleteTags(tags);
  });

  group('Complete Tags Usecase', () {
    test(
        'should return completed tags when passed list of incomplete tags and corresponding complete tags',
        () async {
      List<Tag> incompleteTags = [Tag('tag'), Tag('tag3')];
      List<Tag> completeTags = [
        Tag('tag', title: 'Tag', color: green),
        Tag('tag3', title: 'Tag3', color: black),
      ];

      List<Tag> result = usecase(incompleteTags);

      expect(result, completeTags);
    });

    test('should return remaining completed tags if a particular tag is not found', () async {
      List<Tag> incompleteTags = [Tag('tag'), Tag('tag4')];
      List<Tag> completeTags = [Tag('tag', title: 'Tag', color: green)];

      List<Tag> result = usecase(incompleteTags);

      expect(result, completeTags);
    });
  });
}
