import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

abstract class IUserLoginRepository {
  Future<Either<FailureLogin, bool>> login(UserLoginModel user);
}
