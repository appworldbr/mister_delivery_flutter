import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/get_food_details_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/get_food_details_repository_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_food_details_implementation_test.mocks.dart';

@GenerateMocks([FoodModel, IGetFoodDetailsDatasource])
main() {
  final datasource = MockIGetFoodDetailsDatasource();
  final repository = GetFoodDetailsRepositoryImplementation(datasource);

  test('should return a FoodModel', () async {
    when(datasource.getFood(any)).thenAnswer((_) async => MockFoodModel());
    final result = await repository.getFood(1);
    expect(result.fold(id, id), isA<FoodModel>());
  });

  test('should return FailureFoodDatasource if datasource fails', () async {
    when(datasource.getFood(any)).thenThrow(Exception());
    final result = await repository.getFood(1);
    expect(result.fold(id, id), isA<FailureFoodDatasource>());
  });
}
