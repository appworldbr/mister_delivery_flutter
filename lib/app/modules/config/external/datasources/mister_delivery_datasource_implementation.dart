import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';

import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/config_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';

class MisterDeliveryDatasourceImplementation implements IConfigDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<ConfigModel> getConfig() async {
    final response = await dio.get('http://delivery.local/api/v1.0/settings');
    if (response.statusCode == 200) {
      final configModel = ConfigModel.fromMap(response.data['settings']);
      Modular.get<ConfigSingleton>().setConfigModel(configModel);
      return configModel;
    }

    throw DatasourceError();
  }
}
