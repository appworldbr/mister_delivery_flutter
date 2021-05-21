import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_module.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/login_mock.dart';
import 'mister_delivery_datasource_implementation_test.mocks.dart';

@GenerateMocks([Dio, UserLoginModel])
main() {
  final dio = MockDio();
  final datasource = MisterDeliveryDatasourceImplementation(new Dio());

  final user = UserLoginModel(
    tokenName: 'api test',
    email: 'user@user.com',
    password: 'password',
  );

  initModules([GetUriModule()]);

  test('should return a TokenModel', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: jsonDecode(misterDeliveryTokenMock),
        statusCode: 200,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, completes);
  });

  test('should return a FailureLoginCredentials on Wrong Credential', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: jsonDecode(misterDeliveryLoginCredentialsFailure),
        statusCode: 400,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, throwsA(isA<FailureLoginCredentials>()));
  });

  test('should return FailureLoginDatasource if is\'t 200 or 400', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: jsonDecode(misterDeliveryLoginCredentialsFailure),
        statusCode: 401,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, throwsA(isA<FailureLoginDatasource>()));
  });
}
