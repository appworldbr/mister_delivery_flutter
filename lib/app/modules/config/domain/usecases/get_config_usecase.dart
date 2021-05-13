import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/repositories/config_repository.dart';

abstract class IGetConfig {
  Future<Either<FailureGetConfig, ConfigEntity>> call();
}

class GetConfigUsecase implements IGetConfig {
  final IConfigRepository repository;

  GetConfigUsecase(this.repository);

  @override
  Future<Either<FailureGetConfig, ConfigEntity>> call() async {
    return repository.getConfig();
  }
}
