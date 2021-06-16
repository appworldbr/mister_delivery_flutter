import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/usecases/get_cart_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/cart/external/datasources/mister_delivery_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/repositories/get_cart_repository_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/cart/presenter/pages/cart_page.dart';

class CartModule extends Module {
  final $getCart = [
    Bind.lazySingleton((i) => GetCartRepositoryImplementation(i())),
    Bind.lazySingleton((i) => GetCartUsecase(i())),
  ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => MisterDeliveryDatasource(i())),
        ...$getCart,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => CartPage()),
      ];
}
