import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_request_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/add_food_to_cart_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/add_food_to_cart_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_food_to_cart_usecase_test.mocks.dart';

@GenerateMocks([CartFoodRequestEntity, IAddFoodToCartRepository])
main() {
  final repository = MockIAddFoodToCartRepository();
  final usecase = AddFoodToCartUsecase(repository);

  test('should return true', () async {
    when(repository.addFoodToCart(any)).thenAnswer((_) async => Right(true));
    final result = await usecase(MockCartFoodRequestEntity());
    expect(result.fold(id, id), true);
  });
}
