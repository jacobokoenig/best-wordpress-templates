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

  final incompleteTags2 = [Tag('id2')];
  final completeTags2 = [Tag('id2', title: 'Id2', color: purple)];

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
    Template(
      id: 'id2',
      templateUrl: 'url2',
      thumbnailUrl: 'thumbUrl2',
      title: 'title2',
      description: 'description2',
      owner: 'divi2',
      tags: incompleteTags2,
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
    Template(
      id: 'id2',
      templateUrl: 'url2',
      thumbnailUrl: 'thumbUrl2',
      title: 'title2',
      description: 'description2',
      owner: 'divi2',
      tags: completeTags2,
    ),
  ];

  setUp(() {
    mockCompleteTags = MockCompleteTags();
    mockGetTemplates = MockGetTemplates();

    when(mockGetTemplates()).thenAnswer((_) async => tTemplates);
    when(mockCompleteTags(incompleteTags)).thenAnswer((_) => completeTags);
    when(mockCompleteTags(incompleteTags2)).thenAnswer((_) => completeTags2);
  });

  group('HomeCubit', () {
    HomeLoaded loadedState = HomeLoaded(
      templates: tTemplatesCompleted,
      filteredTemplates: tTemplatesCompleted,
      tags: [allTag, ...tagTaxonomy],
      selectedFilter: allTag,
    );

    HomeLoading loadingState = HomeLoading();

    test('should return HomeLoaded when cubit is created', () async {
      cubit = HomeCubit(getTemplates: mockGetTemplates, completeTags: mockCompleteTags);

      expect(cubit.state, loadingState);

      await expectLater(cubit.stream, emitsInOrder([loadedState]));

      expect(cubit.state, loadedState);
    });
  });

  test('should return all templates when "all" filter is selected', () async {
    cubit = HomeCubit(getTemplates: mockGetTemplates, completeTags: mockCompleteTags);

//The following method just waits until initialization is done before calling filter
    await expectLater(cubit.stream, emitsInOrder([isA<HomeLoaded>()]));

    Tag selectedFilter = allTag; // Tag('all', title: 'Id', color: black)

    cubit.filter(selectedFilter);

    expect(
      cubit.state,
      HomeLoaded(
        templates: tTemplatesCompleted,
        filteredTemplates: tTemplatesCompleted,
        tags: [allTag, ...tagTaxonomy],
        selectedFilter: selectedFilter,
      ),
    );
  });

  test('should return filtered templates when its filter is selected', () async {
    cubit = HomeCubit(getTemplates: mockGetTemplates, completeTags: mockCompleteTags);

    //The following method just waits until initialization is done before calling filter
    await expectLater(cubit.stream, emitsInOrder([isA<HomeLoaded>()]));

    Tag selectedFilter = Tag('id', title: 'Id', color: green);

    cubit.filter(selectedFilter);

    expect(
      cubit.state,
      HomeLoaded(
        templates: tTemplatesCompleted,
        filteredTemplates: [
          Template(
            id: 'id',
            templateUrl: 'url',
            thumbnailUrl: 'thumbUrl',
            title: 'title',
            description: 'description',
            owner: 'divi',
            tags: completeTags,
          ),
        ],
        tags: [allTag, ...tagTaxonomy],
        selectedFilter: selectedFilter,
      ),
    );
  });
}
