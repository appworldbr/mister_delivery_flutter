import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

abstract class ILoginDatasource {
  Future<bool> login(UserLoginModel user);
}
