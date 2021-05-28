import 'package:dio/dio.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/add_food_to_cart_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/get_food_details_datasource.dart';

import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/basic_food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class MisterDeliveryDatasourceImplementation
    implements
        ISearchDatasource,
        IGetFoodDetailsDatasource,
        IAddFoodToCartDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<List<BasicFoodModel>> search(String searchName) async {
    Map<String, String> queryParams = {};

    if (searchName.isNotEmpty) {
      queryParams['q'] = searchName;
    }

    final response = await dio.get(
      UrlSingleton().api + '/food',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    if (response.statusCode == 200) {
      final list = (response.data['food'] as List)
          .map((e) => BasicFoodModel.fromMap(e))
          .toList();

      return list;
    }

    throw FailureFoodDatasource();
  }

  @override
  Future<FoodModel> getFood(int id) async {
    final response = await dio.get(UrlSingleton().api + '/food/$id');

    if (response.statusCode == 200) {
      return FoodModel.fromMap(response.data['food']);
    }

    throw FailureFoodDatasource();
  }

  @override
  Future<bool> addFoodToCart(CartFoodEntity food) async {
    final response = await dio.post(
      UrlSingleton().api + '/cart',
    );

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 430) {
      throw FailureFoodNotFound();
    }

    if (response.statusCode == 431) {
      throw FailureFoodNotActive();
    }

    if (response.statusCode == 432) {
      throw FailureExtraNotFound();
    }

    if (response.statusCode == 433) {
      throw FailureExtraLimitReached();
    }

    throw FailureAddFoodToCart();
  }
}
