import 'package:best_wordpress_sites/home/domain/entities/tag.dart';
import 'package:best_wordpress_sites/home/domain/entities/template.dart';
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart';
import 'package:best_wordpress_sites/home/presentation/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetTemplates])
void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  late HomeCubit cubit;
  late MockGetTemplates mockGetTemplates;

  setUp(() {
    mockGetTemplates = MockGetTemplates();
    cubit = HomeCubit(mockGetTemplates);
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

  // test('HomeCubit', () async {
  //   when(mockGetTemplates()).thenAnswer((_) async => tTemplates);

  //   blocTest(
  //     'emits HomeLoaded when cubit is built',
  //     build: () => cubit,
  //     expect: () => [HomeLoaded(templates: tTemplates)],
  //   );
  // });
}
