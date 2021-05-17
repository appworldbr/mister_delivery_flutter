import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/config/config_module.dart';

class CoreModule extends Module {
  @override
  final List<Module> imports = [
    ConfigModule(),
  ];
}
