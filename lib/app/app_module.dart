import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/core_module.dart';
import 'package:mister_delivery_flutter/app/modules/foods/food_module.dart';
import 'package:mister_delivery_flutter/app/modules/home/home_module.dart';
import 'package:mister_delivery_flutter/app/modules/login/login_module.dart';
import 'package:mister_delivery_flutter/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/splash', module: SplashModule()),
    ModuleRoute('/foods', module: FoodModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
