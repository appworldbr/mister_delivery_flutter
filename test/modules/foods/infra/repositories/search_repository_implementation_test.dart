import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/basic_food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/search_repository_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_implementation_test.mocks.dart';

@GenerateMocks([ISearchDatasource])
main() {
  final datasource = MockISearchDatasource();
  final repository = SearchRepositoryImplementation(datasource);

  test('should return a list of BasicFoodEntity', () async {
    when(datasource.search(any)).thenAnswer((_) async => <BasicFoodModel>[]);
    final result = await repository.searchByName('');
    expect(result.fold(id, id), isA<List<BasicFoodModel>>());
  });

  test('should return a FailureFoodDatasource if datasource fails', () async {
    when(datasource.search(any)).thenThrow(Exception());
    final result = await repository.searchByName('');
    expect(result.fold(id, id), isA<FailureFoodDatasource>());
  });
}
