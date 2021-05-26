import 'package:dio/dio.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_module.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/shared/custom_browser_dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mister_delivery_datasource_implementation_test.mocks.dart';

@GenerateMocks([Dio, UserLoginModel])
main() {
  final dio = MockDio();

  when(dio.get(any)).thenAnswer(
    (_) async => Response(
      data: true,
      statusCode: 200,
      requestOptions: new RequestOptions(path: ''),
    ),
  );

  final datasource = MisterDeliveryDatasourceImplementation(dio);

  final user = UserLoginModel(
    email: 'user@user.com',
    password: 'password',
  );

  initModules([GetUriModule()]);

  test('should return a true', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: true,
        statusCode: 200,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, completes);
  });

  test('should return FailureUserAlreadyLogged if is 302', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: '',
        statusCode: 302,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, throwsA(isA<FailureUserAlreadyLogged>()));
  });

  test('should return FailureLoginDatasource if is\'t 200 or 302', () {
    when(dio.post(any, data: user.toJson())).thenAnswer(
      (_) async => Response(
        data: '',
        statusCode: 401,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final future = datasource.login(user);
    expect(future, throwsA(isA<FailureLoginDatasource>()));
  });
}
