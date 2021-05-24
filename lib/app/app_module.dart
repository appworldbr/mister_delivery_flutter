import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/core_module.dart';
import 'package:mister_delivery_flutter/app/modules/foods/food_module.dart';
import 'package:mister_delivery_flutter/app/shared/custom_dio.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Dio>((i) => CustomDio().instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: FoodModule()),
  ];
}
