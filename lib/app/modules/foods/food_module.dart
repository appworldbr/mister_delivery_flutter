import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/search_by_name_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/search_repository_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/pages/search_page.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/search_store.dart';

class FoodModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MisterDeliveryDatasource(i())),
    Bind.lazySingleton((i) => SearchRepositoryImplementation(i())),
    Bind.lazySingleton((i) => SearchByNameUsecase(i())),
    Bind.lazySingleton((i) => SearchStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SearchPage()),
  ];
}
