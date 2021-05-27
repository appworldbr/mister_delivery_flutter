import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/config/config_module.dart';
import 'package:mister_delivery_flutter/app/shared/custom_dio/web/custom_dio_web_module.dart';
import 'package:mister_delivery_flutter/app/shared/url/web/url_web_module.dart';

class CoreModule extends Module {
  @override
  final List<Module> imports = [
    UrlWebModule(),
    ConfigModule(),
    CustomDioWebModule(),
  ];
}
