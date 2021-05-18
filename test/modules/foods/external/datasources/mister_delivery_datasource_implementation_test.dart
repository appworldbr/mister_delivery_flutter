import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/basic_foods_mock.dart';
import 'mister_delivery_datasource_implementation_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = MisterDeliveryDatasource(dio);

  test('should return a list of BasicFoodModel', () {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(basicFoodMock),
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
        data: jsonDecode(basicFoodMock),
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
        data: jsonDecode(basicFoodMock),
        statusCode: 401,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.search('');
    expect(future, throwsA(isA<FailureFoodDatasource>()));
  });
}
