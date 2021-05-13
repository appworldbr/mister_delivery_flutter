import 'package:dio/dio.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';

import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/get_config_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';

class LaravelDatasource implements IGetConfigDatasource {
  final Dio dio;

  LaravelDatasource(this.dio);

  @override
  Future<ConfigModel> getConfig() async {
    final response = await dio.get('http://delivery.local/api/v1.0/settings');

    if (response.statusCode == 200) {
      return ConfigModel.fromMap(response.data['settings']);
    }

    throw DatasourceError();
  }
}
