import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MisterDeliveryDatasourceImplementation implements ILoginDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<bool> login(UserLoginModel user) async {
    final uri = Modular.get<UriSingleton>().base;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('xsrf', '');

    await dio.get(uri + "/sanctum/csrf-cookie");

    final response = await dio.post(uri + "/login", data: user.toJson());

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 302) {
      throw FailureUserAlreadyLogged();
    }

    throw FailureLoginDatasource();
  }
}
