import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/config_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/repositories/get_config_repository_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_config_repository_implementation_test.mocks.dart';

@GenerateMocks([ConfigModel, IConfigDatasource])
main() {
  final datasource = new MockIConfigDatasource();
  final repository = ConfigRepositoryImplementation(datasource);

  test('should return GetConfig', () async {
    when(datasource.getConfig()).thenAnswer((_) async => new MockConfigModel());

    final result = await repository.getConfig();

    expect(result.fold(id, id), isA<ConfigEntity>());
  });

  test('should return DatasourceError if datasource fail', () async {
    when(datasource.getConfig()).thenThrow(Exception());

    final result = await repository.getConfig();

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
