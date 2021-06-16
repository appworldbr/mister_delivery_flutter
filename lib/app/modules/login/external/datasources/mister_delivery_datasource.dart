import 'package:dio/dio.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class MisterDeliveryDatasource implements ILoginDatasource {
  final Dio dio;

  MisterDeliveryDatasource(this.dio);

  @override
  Future<bool> login(UserLoginModel user) async {
    final urlSingleton = UrlSingleton();

    await dio.get(urlSingleton.domain + "/sanctum/csrf-cookie");

    final response =
        await dio.post(urlSingleton.api + "/user/login", data: user.toJson());

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 419) {
      throw FailureSessionStore();
    }

    throw FailureLoginDatasource();
  }
}
