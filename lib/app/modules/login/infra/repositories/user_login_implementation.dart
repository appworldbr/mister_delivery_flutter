import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/repositories/user_login_repository.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

class UserLoginImplementation extends IUserLoginRepository {
  final ILoginDatasource datasource;

  UserLoginImplementation(this.datasource);

  @override
  Future<Either<FailureLogin, bool>> login(UserLoginModel user) async {
    try {
      final result = await datasource.login(user);
      return Right(result);
    } catch (e) {
      return Left(FailureLoginDatasource());
    }
  }
}
