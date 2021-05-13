import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/repositories/config_repository.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/config_datasource.dart';

class ConfigRepositoryImplementation implements IConfigRepository {
  final IConfigDatasource datasource;

  ConfigRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureGetConfig, ConfigEntity>> getConfig() async {
    try {
      final result = await datasource.getConfig();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
