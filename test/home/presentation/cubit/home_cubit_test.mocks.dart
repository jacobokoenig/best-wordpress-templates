// Mocks generated by Mockito 5.0.13 from annotations
// in best_wordpress_sites/test/home/presentation/cubit/home_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:best_wordpress_sites/home/domain/entities/template.dart' as _i5;
import 'package:best_wordpress_sites/home/domain/repositories/templates_repository.dart'
    as _i2;
import 'package:best_wordpress_sites/home/domain/usecases/get_templates.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeTemplatesRepository extends _i1.Fake
    implements _i2.TemplatesRepository {}

/// A class which mocks [GetTemplates].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTemplates extends _i1.Mock implements _i3.GetTemplates {
  MockGetTemplates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TemplatesRepository get templatesRepository =>
      (super.noSuchMethod(Invocation.getter(#templatesRepository),
          returnValue: _FakeTemplatesRepository()) as _i2.TemplatesRepository);
  @override
  set templatesRepository(_i2.TemplatesRepository? _templatesRepository) =>
      super.noSuchMethod(
          Invocation.setter(#templatesRepository, _templatesRepository),
          returnValueForMissingStub: null);
  @override
  _i4.Future<List<_i5.Template>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue: Future<List<_i5.Template>>.value(<_i5.Template>[]))
          as _i4.Future<List<_i5.Template>>);
  @override
  String toString() => super.toString();
}
