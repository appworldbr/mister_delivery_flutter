import 'package:mister_delivery_flutter/app/modules/login/domain/entities/response/token_entity.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

abstract class ILoginDatasource {
  Future<TokenEntity> login(UserLoginModel user);
}
