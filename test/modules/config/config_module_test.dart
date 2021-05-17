import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/app_module.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/usecases/get_config_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'external/datasources/laravel_datasource_test.mocks.dart';
import 'mocks/config_mock.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();

  initModule(
    AppModule(),
    replaceBinds: [
      Bind<Dio>((i) => dio),
    ],
  );

  test('should return GetConfigUsecase without error', () {
    final usecase = Modular.get<IGetConfig>();
    expect(usecase, isA<GetConfigUsecase>());
  });

  test('should return a global singleton instance of app configuration', () {
    final config = Modular.get<ConfigSingleton>();
    expect(config.getModel(), isA<ConfigEntity>());
  });

  test('should return GetConfigModel', () async {
    // @todo: verificar porque não está pegando o mock do dio
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(configMock),
          statusCode: 200,
          requestOptions: new RequestOptions(path: ''),
        ));

    final usecase = Modular.get<GetConfigUsecase>();
    final result = await usecase();
    expect(result.fold(dartz.id, dartz.id), isA<ConfigModel>());
  });
}
