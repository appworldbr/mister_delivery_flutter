import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/get_food_details_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_food_details_usecase_test.mocks.dart';

@GenerateMocks([FoodEntity, IGetFoodDetailsRepository])
main() {
  final repository = MockIGetFoodDetailsRepository();
  final usecase = GetFoodDetailsUsecase(repository);

  test('should return a FoodEntity', () async {
    when(repository.getFood(any))
        .thenAnswer((_) async => Right(MockFoodEntity()));

    final result = await usecase(1);
    expect(result.fold(id, id), isA<FoodEntity>());
  });

  test('should return error FailureFoodIdIncorrect if id is incorrect',
      () async {
    when(repository.getFood(any))
        .thenAnswer((_) async => Right(MockFoodEntity()));
    final result = await usecase(0);
    expect(result.fold(id, id), isA<FailureFoodIdIncorrect>());
  });
}
