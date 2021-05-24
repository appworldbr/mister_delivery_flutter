import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/repositories/user_login_repository.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

abstract class ILoginWithEmail {
  Future<Either<FailureLogin, bool>> call(UserLoginModel user);
}

class LoginWithEmailUsecase implements ILoginWithEmail {
  final IUserLoginRepository repository;

  LoginWithEmailUsecase(this.repository);

  @override
  Future<Either<FailureLogin, bool>> call(UserLoginModel user) async {
    return repository.login(user);
  }
}
