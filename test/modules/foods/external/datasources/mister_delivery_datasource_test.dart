import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/external/datasources/mister_delivery_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_extra_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_food_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/response/basic_foods_mock.dart';
import '../../mocks/response/food_mock.dart';
import 'mister_delivery_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = MisterDeliveryDatasource(dio);

  group('ISearchDatasource', () {
    test('should return a list of BasicFoodModel', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryBasicFoodMock),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.search('');
      expect(future, completes);
    });

    test('should return a list of BasicFoodModel with params', () {
      when(dio.get(any, queryParameters: {'q': 'test'})).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryBasicFoodMock),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.search('test');
      expect(future, completes);
    });

    test('should return a error FailureFoodDatasource if code is\'t 200', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryBasicFoodMock),
          statusCode: 401,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.search('');
      expect(future, throwsA(isA<FailureFoodDatasource>()));
    });
  });

  group('IGetFoodDetailsDatasource', () {
    test('should return a FoodModel', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryFoodMock),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.getFood(1);
      expect(future, completes);
    });

    test('should return a error FailureFoodDatasource if code is\'t 200', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryFoodMock),
          statusCode: 401,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.search('');
      expect(future, throwsA(isA<FailureFoodDatasource>()));
    });
  });

  group('IAddFoodToCartDatasource', () {
    final food = CartFoodModel(
      id: 1,
      quantity: 2,
      extras: [
        CartExtraModel(id: 1, quantity: 2),
        CartExtraModel(id: 2, quantity: 2),
        CartExtraModel(id: 3, quantity: 2),
      ],
      observation: '',
    );
    test('should return true when added food in cart', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: '',
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, completes);
    });

    test('should return a error FailureFoodNotFound if code is 430', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 430,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureFoodNotFound>()));
    });

    test('should return a error FailureFoodNotActive if code is 431', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 431,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureFoodNotActive>()));
    });

    test('should return a error FailureExtraNotFound if code is 432', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 432,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureExtraNotFound>()));
    });

    test('should return a error FailureExtraLimitReached if code is 433', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 433,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureExtraLimitReached>()));
    });

    test('should return a error FailureLoginRequired if code is 401', () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 401,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureLoginRequired>()));
    });

    test(
        'should return a error FailureAddFoodToCart if code is any other error',
        () {
      when(dio.post(any, data: food.toJson())).thenAnswer(
        (_) async => Response(
          data: true,
          statusCode: 455,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.addFoodToCart(food);
      expect(future, throwsA(isA<FailureAddFoodToCart>()));
    });
  });
}
