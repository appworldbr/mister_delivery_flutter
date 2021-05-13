import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/repositories/config_repository.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/usecases/get_config_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_config_usecase_test.mocks.dart';

@GenerateMocks([ConfigEntity, IConfigRepository])
main() {
  final repository = MockIConfigRepository();
  final usecase = GetConfigUsecase(repository);

  test('should get the configuration', () async {
    when(repository.getConfig())
        .thenAnswer((_) async => Right(new MockConfigEntity()));

    final result = await usecase();
    expect(result.fold(id, id), isA<ConfigEntity>());
  });
}
