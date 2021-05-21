import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/entities/response/token_entity.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/response/token_model.dart';

class MisterDeliveryDatasourceImplementation implements ILoginDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<TokenEntity> login(UserLoginModel user) async {
    final test = await dio.get(Modular.get<UriSingleton>().uri + '/asd');
    print(test);

    final response = await dio.post(
        Modular.get<UriSingleton>().uri + '/user/login',
        data: user.toJson());

    if (response.statusCode == 200) {
      // var cookieJar = CookieJar();
      // dio.interceptors.add(CookieManager(cookieJar));

      return TokenModel.fromMap(response.data);
    }

    if (response.statusCode == 400) {
      throw FailureLoginCredentials();
    }

    throw FailureLoginDatasource();
  }
}
