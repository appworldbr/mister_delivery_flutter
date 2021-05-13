import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/config/external/datasources/laravel_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../utils/laravelResource.dart';
import 'laravel_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = new LaravelDatasource(dio);

  test('should get the ResultConfigModel', () {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(laravelResult),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ));

    final future = datasource.getConfig();
    expect(future, completes);
  });

  test('should return DatasourceError if code is\'t 200', () {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: new RequestOptions(path: ''),
        ));

    final future = datasource.getConfig();
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
