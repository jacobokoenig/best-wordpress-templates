import 'package:best_wordpress_sites/core/constants/constants.dart';
import 'package:best_wordpress_sites/home/data/fixtures/tag_taxonomy.dart';
import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/usecases/complete_tags.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetTemplates, CompleteTags])
void main() {
  late HomeCubit cubit;
  late MockGetTemplates mockGetTemplates;
  late MockCompleteTags mockCompleteTags;

  final incompleteTags = [Tag('id')];
  final completeTags = [Tag('id', title: 'Id', color: green)];

  final tTemplates = [
    Template(
      id: 'id',
      templateUrl: 'url',
      thumbnailUrl: 'thumbUrl',
      title: 'title',
      description: 'description',
      owner: 'divi',
      tags: incompleteTags,
    ),
  ];

  final tTemplatesCompleted = [
    Template(
      id: 'id',
      templateUrl: 'url',
      thumbnailUrl: 'thumbUrl',
      title: 'title',
      description: 'description',
      owner: 'divi',
      tags: completeTags,
    ),
  ];

  setUp(() {
    mockCompleteTags = MockCompleteTags();
    mockGetTemplates = MockGetTemplates();

    when(mockGetTemplates()).thenAnswer((_) async => tTemplates);
    when(mockCompleteTags(any)).thenAnswer((_) => completeTags);
  });

  test('HomeCubit', () async {
    cubit = HomeCubit(getTemplates: mockGetTemplates, completeTags: mockCompleteTags);

    HomeLoaded loadedState = HomeLoaded(
      templates: tTemplatesCompleted,
      tags: [Tag('all', title: 'All', color: black), ...tagTaxonomy],
      selectedFilter: tagTaxonomy[0],
    );

    HomeLoading loadingState = HomeLoading();

    expect(cubit.state, loadingState);

    await expectLater(cubit.stream, emitsInOrder([loadedState]));

    expect(cubit.state, loadedState);
  });
}
