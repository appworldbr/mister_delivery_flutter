import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/cart/presenter/pages/cart_page.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => CartPage()),
      ];
}
