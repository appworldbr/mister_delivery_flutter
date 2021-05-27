import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/core_module.dart';
import 'package:mister_delivery_flutter/app/modules/foods/food_module.dart';
import 'package:mister_delivery_flutter/app/modules/home/home_module.dart';
import 'package:mister_delivery_flutter/app/modules/login/login_module.dart';
import 'package:mister_delivery_flutter/app/modules/splash/splash_module.dart';
// import 'package:mister_delivery_flutter/app/shared/custom_dio/web/custom_dio_web_module.dart';
// import 'package:mister_delivery_flutter/app/shared/custom_dio/custom_browser_dio.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => null)
    // Bind.lazySingleton<Dio>((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    // ModuleRoute(Modular.initialRoute, module: SplashModule()),
    // ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/splash', module: SplashModule()),
    ModuleRoute('/foods', module: FoodModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
