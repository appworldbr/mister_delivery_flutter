import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/search_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/search_by_name_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_name_usecase_test.mocks.dart';

@GenerateMocks([ISearchRepository])
main() {
  final repository = MockISearchRepository();
  final usecase = SearchByNameUsecase(repository);

  test('should return a list of BasicFoodEntity', () async {
    when(repository.searchByName(any))
        .thenAnswer((_) async => Right(<BasicFoodEntity>[]));

    final result = await usecase('');
    expect(result.fold(id, id), isA<List<BasicFoodEntity>>());
  });
}
