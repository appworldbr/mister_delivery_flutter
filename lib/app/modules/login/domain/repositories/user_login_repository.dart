import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/entities/response/token_entity.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

abstract class IUserLoginRepository {
  Future<Either<FailureLogin, TokenEntity>> login(UserLoginModel user);
}
