import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/get_food_details_datasource.dart';

import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/basic_food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/food_model.dart';

class MisterDeliveryDatasourceImplementation
    implements ISearchDatasource, IGetFoodDetailsDatasource {
  final Dio dio;

  MisterDeliveryDatasourceImplementation(this.dio);

  @override
  Future<List<BasicFoodModel>> search(String searchName) async {
    Map<String, String> queryParams = {};

    if (searchName.isNotEmpty) {
      queryParams['q'] = searchName;
    }

    final response = await dio.get(
      Modular.get<UriSingleton>().uri + '/food',
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
    final response =
        await dio.get(Modular.get<UriSingleton>().uri + '/food/$id');

    if (response.statusCode == 200) {
      return FoodModel.fromMap(response.data['food']);
    }

    throw FailureFoodDatasource();
  }
}
