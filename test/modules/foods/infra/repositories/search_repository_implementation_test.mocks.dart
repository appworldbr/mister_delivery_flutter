// Mocks generated by Mockito 5.0.7 from annotations
// in mister_delivery_flutter/test/modules/foods/infra/repositories/search_repository_implementation_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart'
    as _i2;
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/basic_food_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [ISearchDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockISearchDatasource extends _i1.Mock implements _i2.ISearchDatasource {
  MockISearchDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.BasicFoodModel>> search(String? searchName) =>
      (super.noSuchMethod(Invocation.method(#search, [searchName]),
          returnValue: Future<List<_i4.BasicFoodModel>>.value(
              <_i4.BasicFoodModel>[])) as _i3.Future<List<_i4.BasicFoodModel>>);
}
