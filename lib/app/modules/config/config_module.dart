import 'package:flutter_modular/flutter_modular.dart';

import 'package:mister_delivery_flutter/app/modules/config/domain/usecases/get_config_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/config/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/repositories/get_config_repository_implementation.dart';

class ConfigModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => MisterDeliveryDatasourceImplementation(i()),
        export: true),
    Bind.singleton((i) => ConfigRepositoryImplementation(i()), export: true),
    Bind.singleton((i) => GetConfigUsecase(i()), export: true),
    Bind.singleton((i) => ConfigSingleton(), export: true),
  ];
}
