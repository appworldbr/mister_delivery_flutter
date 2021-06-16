import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_response_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/repositories/get_cart_repository.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/usecases/get_cart_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cart_usecase_test.mocks.dart';

@GenerateMocks([IGetCartRepository])
main() {
  final repository = MockIGetCartRepository();
  final usecase = GetCartUsecase(repository);
  test('should return List<CartFoodEntity>', () async {
    when(repository.getCart()).thenAnswer((_) async => Right([]));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<CartFoodResponseEntity>>());
  });
}
