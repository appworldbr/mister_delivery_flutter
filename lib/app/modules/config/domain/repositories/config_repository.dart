import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';

abstract class IConfigRepository {
  Future<Either<FailureGetConfig, ConfigEntity>> getConfig();
}
