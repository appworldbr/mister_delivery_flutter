import 'package:dio/dio.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class MisterDeliveryDatasourceImplementation implements ILoginDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<bool> login(UserLoginModel user) async {
    final urlSingleton = UrlSingleton();

    await dio.get(urlSingleton.base + "/sanctum/csrf-cookie");

    final response =
        await dio.post(urlSingleton.base + "/app/login", data: user.toJson());

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 419) {
      throw FailureSessionStore();
    }

    throw FailureLoginDatasource();
  }
}
