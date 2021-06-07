import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/add_food_to_cart_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/add_food_to_cart_repository_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_food_to_cart_implementation_test.mocks.dart';

@GenerateMocks([CartFoodEntity, IAddFoodToCartDatasource])
main() {
  final datasource = MockIAddFoodToCartDatasource();
  final repository = AddFoodToCartRepositoryImplementation(datasource);

  test('should return true', () async {
    when(datasource.addFoodToCart(any)).thenAnswer((_) async => true);
    final result = await repository.addFoodToCart(MockCartFoodEntity());
    expect(result.fold(id, id), true);
  });

  test('should return FailureAddFoodToCart', () async {
    when(datasource.addFoodToCart(any)).thenThrow(Exception());
    final result = await repository.addFoodToCart(MockCartFoodEntity());
    expect(result.fold(id, id), isA<FailureAddFoodToCart>());
  });
}
