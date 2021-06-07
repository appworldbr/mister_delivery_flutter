import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/add_food_to_cart_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/search_by_name_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/external/datasources/mister_delivery_datasource_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/add_food_to_cart_repository_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/get_food_details_repository_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/repositories/search_repository_implementation.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/pages/details_page.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/pages/search_page.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/details_store.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/search_store.dart';

class FoodModule extends Module {
  final $searchByName = [
    Bind.lazySingleton((i) => SearchRepositoryImplementation(i())),
    Bind.lazySingleton((i) => SearchByNameUsecase(i())),
  ];

  final $getFoodDetails = [
    Bind.lazySingleton((i) => GetFoodDetailsRepositoryImplementation(i())),
    Bind.lazySingleton((i) => GetFoodDetailsUsecase(i())),
  ];

  final $addFoodToCart = [
    Bind.lazySingleton((i) => AddFoodToCartRepositoryImplementation(i())),
    Bind.lazySingleton((i) => AddFoodToCartUsecase(i())),
  ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => MisterDeliveryDatasourceImplementation(i())),
        ...$searchByName,
        ...$getFoodDetails,
        ...$addFoodToCart,
        Bind.lazySingleton((i) => DetailsStore(i(), i())),
        Bind.lazySingleton((i) => SearchStore(i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SearchPage()),
    ChildRoute(
      '/:id',
      child: (_, args) => DetailsPage(
        id: args.params['id'],
      ),
      transition: TransitionType.rightToLeftWithFade,
    ),
  ];
}
