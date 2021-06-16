import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/cart/external/datasources/mister_delivery_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../foods/mocks/response/cart_mock.dart';
import 'mister_delivery_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = MisterDeliveryDatasource(dio);

  group('IGetCartDatasource', () {
    test('Should return List<CartFoodResponseEntity>', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryCart),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ),
      );
      final future = datasource.getCart();
      expect(future, completes);
    });

    test('should return a error FailureCartDatasource if code is\'t 200', () {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(misterDeliveryCart),
          statusCode: 401,
          requestOptions: new RequestOptions(path: ''),
        ),
      );

      final future = datasource.getCart();
      expect(future, throwsA(isA<FailureCartDatasource>()));
    });

  });
}
