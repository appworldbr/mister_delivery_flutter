import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';

abstract class IGetConfigDatasource {
  Future<ConfigModel> getConfig();
}
