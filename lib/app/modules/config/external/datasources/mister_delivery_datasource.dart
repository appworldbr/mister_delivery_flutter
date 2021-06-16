import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/errors/errors.dart';

import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/config_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class MisterDeliveryDatasource implements IConfigDatasource {
  final Dio dio;

  MisterDeliveryDatasource(this.dio);

  @override
  Future<ConfigModel> getConfig() async {
    final response = await dio.get(
      UrlSingleton().api + '/settings',
    );
    if (response.statusCode == 200) {
      final configModel = ConfigModel.fromMap(response.data['settings']);
      Modular.get<ConfigSingleton>().setConfigModel(configModel);
      return configModel;
    }

    throw DatasourceError();
  }
}
