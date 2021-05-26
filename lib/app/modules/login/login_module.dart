import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/login/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/repositories/user_login_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/login/presenter/pages/login_page.dart';
import 'package:mister_delivery_flutter/app/modules/login/presenter/stores/login_store.dart';
import 'package:mister_delivery_flutter/app/modules/login/presenter/stores/password_obscure_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MisterDeliveryDatasourceImplementation(i())),
    Bind.lazySingleton((i) => UserLoginImplementation(i())),    
    Bind.lazySingleton((i) => LoginWithEmailUsecase(i())),
    Bind.lazySingleton((i) => PasswordObsctureStore()),
    Bind.lazySingleton((i) => LoginStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
