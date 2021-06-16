import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/datasource/get_cart_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/models/response/cart_food_response_model.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/repositories/get_cart_repository_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cart_repository_implementation_test.mocks.dart';

@GenerateMocks([IGetCartDatasource])
main() {
  final datasource = MockIGetCartDatasource();
  final repository = GetCartRepositoryImplementation(datasource);

  test('should return CartFoodResponseModel', () async {
    when(datasource.getCart())
        .thenAnswer((_) async => ([].cast<CartFoodResponseModel>()));
    final result = await repository.getCart();
    expect(result.fold(id, id), isA<List<CartFoodResponseModel>>());
  });

  test('should return FailureAddFoodToCart', () async {
    when(datasource.getCart()).thenThrow(Exception());
    final result = await repository.getCart();
    expect(result.fold(id, id), isA<FailureCartDatasource>());
  });
}
